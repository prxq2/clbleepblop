(in-package :clbleepblop)

(defmethod initialize-instance :after ((bot bot) &key (initialize nil) &allow-other-keys)
  (when initialize
    (setf (slot-value bot 'user)
	  (tg-get-me bot))))

(defun make-handler-table (slots)
  (let ((tab (make-hash-table :test #'equalp)))
    (loop for s in slots
	  do
	     (destructuring-bind (sname &key slot-type) s
		 (when slot-type
		   (setf (gethash (intern sname :keyword) tab)
			 (maker-name slot-type)))))
    tab))

(defparameter *update-handlers*
  (make-handler-table *interesting-slots-in-update*))

(defmacro define-bot-handler-methods ()
  (let* ((update-types (mapcar #'make-translated-symbol
			       (remove-duplicates
				(mapcan #'(lambda (x)
					    ;; avoid corruption issues
					    (copy-list (last x)))
					*interesting-slots-in-update*)
				:test #'equalp)))

	 (methods (loop for x in update-types
			collecting
			`(defmethod handle-update ((bot bot) (item ,x) update)
			   (if (strict-mode bot)
			       (error ,(format nil "No handler for updates from type ~A found." x))
			       (warn ,(format nil "No handler for updates from type ~A found." x)))))))

    `(progn ,@methods)))

(define-bot-handler-methods)

;; Updates are special, so we have a different class for that
(defclass update ()
  ((update-id :initarg :update-id :reader update-id)
   (update-item :initarg :update-item :reader update-item)
   (subject :initarg :subject :reader subject)
   (original-json :initarg :original-json :reader original-json)))

(defmethod print-object ((o update) stream)
  (print-unreadable-object (o stream :type t)
    (format stream "id: ~A, subject: ~A" (update-id o) (subject o))))

(defun make-update-from-json (json)
  (let* ((jsonx (copy-list json))
	 (update-id (getf jsonx :|update_id|)))
    (remf jsonx :|update_id|)
    (destructuring-bind (marker more-json) jsonx
      (let ((item (funcall (gethash marker *update-handlers*) more-json)))

	(make-instance 'update
		       :subject marker
		       :update-item item
		       :update-id update-id
		       :original-json json)))))

(defmethod tg-get-updates ((bot bot) &key offset limit timeout allowed-updates)
  (let* ((args (maybe-add nil "offset" offset))
	 (args (maybe-add args "limit" limit))
	 (args (maybe-add args "timeout" timeout))
	 (args (maybe-add args "allowed_updates" allowed-updates))
	 (stuff (handle-request bot "getUpdates" args)))

    (mapcar #'make-update-from-json stuff)))

(defun run-telegram-bot (bot &key (timeout *default-timeout*))
  (let ((operative-timeout nil)
	(offset nil))
    (loop do
      (format t "Polling for updates. Timeout = ~A.~%" operative-timeout)
      (let ((latest-updates (tg-get-updates bot :offset offset
						:timeout operative-timeout)))

	(setf operative-timeout timeout)

	(loop for update in latest-updates do
	  (format t "Handling update with ID ~A~%" (update-id update))
	  (setf offset (+ 1 (max (update-id update)
				 (or offset 0))))

	  (handle-update bot (update-item update) update))))))
