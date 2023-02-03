(in-package :clbleepblop)

;; A class to paint them all
(defclass tg-object ()
  ((%tg-deserialize-slotspec :initarg %tg-deserialize-slotspec
		     :reader %tg-deserialize-slotspec
			     :allocation :class)))

;; If you know how to make this prettier: send me a patch! :-)
(defmethod print-object ((o tg-object) stream)
  (print-unreadable-object (o stream :type t)
    (let* ((slots (mapcar #'sb-mop:slot-definition-name
			  (sb-mop:class-direct-slots (class-of o))))
	   (slots (remove '%tg-deserialize-slotspec slots))
	   (slotvals (loop for s in slots collecting (cons s (slot-value o s))))
	   (slotvals (remove-if #'(lambda (x) (not (cdr x))) slotvals)))

      (loop for cons on slotvals
	    do (destructuring-bind (a . b) (car cons)
		 (format stream "~(~a~): ~s" a b))
	    when (cdr cons) do (format stream ",~%")))))

(defmethod serialize ((obj T) &key not-toplevel)
  (declare (ignore not-toplevel))
  obj)

(defmethod serialize ((obj cons) &key not-toplevel)
  (declare (ignore not-toplevel))
  (mapcar #'(lambda (x) (serialize x :not-toplevel t)) obj))

(defun maybe-append (list key value)
  (if value
      `(,key ,value ,@list)
      list))

(defmethod serialize ((obj tg-object) &key not-toplevel)
  (let ((result))
    (loop for (tag . name) in (%tg-deserialize-slotspec obj) do
      (setf result (maybe-append result tag (serialize (slot-value obj name) :not-toplevel t))))
    (if not-toplevel
	result
	(jonathan:to-json result))))

(defun make-translated-symbol (particles &key (package *package*))
  (let ((particles (if (consp particles) particles (list particles))))
    (let* ((raw (loop for p in particles
		      collecting (if (stringp p)
				     (string-upcase (kebab:to-kebab-case p))
				     (symbol-name p))))

	   (reparticulated
	     (mapcon #'(lambda (x)
			 (if (cdr x)
			     (list (car x) "-")
			     (list (car x))))
		     raw))

	   (symbol-name (apply #'concatenate 'string reparticulated)))

      (intern symbol-name package))))

(defun maker-name (name)
  (make-translated-symbol `(make ,name from json)))

(defun safe-accessor (name slot)
  (if (member slot '("type" "length" "position") :test #'string=)
      (make-translated-symbol (list name slot))
      (make-translated-symbol slot)))

(defun maker-form (maker-name data-source dimensions)
  (let ((arg (gensym)))
    `((lambda (,arg)
	(when ,arg
	  ,(cond ((null dimensions) `(,maker-name ,arg))
		 ((= dimensions 1) `(mapcar ',maker-name ,arg))
		 ((= dimensions 2) `(mapcar #'(lambda (l) (mapcar ',maker-name l)) ,arg)))))
      ,data-source)))

(defun tg-class-json-keys (slot-names)
  (loop for slot-name in slot-names collecting (intern slot-name
						       :keyword)))

(defun make-deserialization-slotspec (slotspecs)
  (loop for form in slotspecs
	collecting
	(destructuring-bind (slot-name &rest stuff) form
	  (declare (ignore stuff))
	  (let ((slot-symbol (make-translated-symbol (list slot-name)))
		(slot-tag (intern slot-name :keyword)))

	    (cons slot-tag slot-symbol)))))

(defun %def-api-class-and-deserializer (arg)
  (destructuring-bind (name (&rest slotspecs)) arg
    (let* ((real-name (make-translated-symbol name))
	   (class-slots
	     (loop for form in slotspecs
		   collecting
		   (destructuring-bind (slot-name &key slot-type slot-dimensions default) form
		     (declare (ignore slot-dimensions slot-type)) ;; exactly, who cares?
		     (let ((slot-symbol (make-translated-symbol (list slot-name)))
			   (initarg (make-translated-symbol (list slot-name)
							    :package 'keyword))
			   (initform (if default
					 `(:initform ,default))))

		       `(,slot-symbol :initarg ,initarg :initform nil :accessor ,(safe-accessor real-name slot-name) ,@initform)))))
	   (class-form `(defclass ,real-name (tg-object)
			  ((%tg-deserialize-slotspec :initform ',(make-deserialization-slotspec slotspecs)
						     :allocation :class)
			   ,@class-slots)))

	   (initargs (mapcan #'(lambda (form)
				 (destructuring-bind (slot-name &key slot-type slot-dimensions default) form
				   (declare (ignore default))
				   (list (make-translated-symbol slot-name
								 :package 'keyword)
					 (if slot-type
					     (maker-form (maker-name slot-type) (intern slot-name) slot-dimensions)
					     (intern slot-name)))))
			     slotspecs))
	   (argl (mapcar #'(lambda (x) (intern (car x)))
			 slotspecs))
	   (deserializer `(defun ,(maker-name name) (form)
			    (if (consp form)
				(destructuring-bind (&key ,@argl) form
				  (make-instance ',real-name
						 ,@initargs))
				form))))

      `(progn
	 ,class-form
	 ,deserializer))))

(defmacro def-api-class-and-deserializer (name (&rest slotspecs))
  (%def-api-class-and-deserializer `(,name ,slotspecs)))

(defun safe-api-name (name)
  (make-translated-symbol (list 'tg name)))

(defvar *last-answer* nil)
(defvar *last-contents* nil)
(defun handle-request (bot name content)
  (setf *last-contents* content)
  (let* ((uri (req-uri bot name))
	 (result (jonathan:parse
		  (dex:post uri
			    :content content
			    :verbose *api-verbose*))))
    (setf *last-answer* result)
    (if (getf result :|ok|)
	(getf result :|result|)
	(error "THAT WAS NOT OK!"))))

(defun maybe-add (list key value)
  (if value
      (cons (cons key value) list)
      list))

(defun %def-api-method (name slots &key return-type return-dimensions)
  (let* ((argl-symbol (gensym))
	 (args (loop for s in slots
		     collecting
		     (make-translated-symbol s)))
	 (adders (loop for s in (reverse slots)
		       collecting
		       `(,argl-symbol (maybe-add ,argl-symbol ,s
						 (serialize ,(make-translated-symbol s))))))
	 (api-call `(handle-request bot ,name ,argl-symbol))
	 (maker-name (maker-name return-type))

	 (wrapped (if return-type (maker-form maker-name api-call return-dimensions)
		      api-call)))

    `(defmethod ,(safe-api-name name) ((bot bot) &key ,@args)
       (let* ((,argl-symbol nil) ,@adders)
	 ,wrapped))))

(defmacro def-api-method (name slots &key return-type return-dimensions)
  (%def-api-method name slots :return-type return-type :return-dimensions return-dimensions))

(defparameter *interesting-slots-in-update*
  '(("message" :slot-type "Message")
    ("edited_message" :slot-type "Message")
    ("channel_post" :slot-type "Message")
    ("edited_channel_post" :slot-type "Message")
    ("inline_query" :slot-type "InlineQuery")
    ("chosen_inline_result" :slot-type "ChosenInlineResult")
    ("callback_query" :slot-type "CallbackQuery")
    ("shipping_query" :slot-type "ShippingQuery")
    ("pre_checkout_query" :slot-type "PreCheckoutQuery")
    ("poll" :slot-type "Poll")
    ("poll_answer" :slot-type "PollAnswer")
    ("my_chat_member" :slot-type "ChatMemberUpdated")
    ("chat_member" :slot-type "ChatMemberUpdated")
    ("chat_join_request" :slot-type "ChatJoinRequest")))
