(in-package clbleepblop)

;; Run these bots with
;; (run-telegram-bot (make-instance '<bot-class> :token <your bot token>))

(defclass echo-bot (bot) ())

(defmethod handle-update ((bot echo-bot) (message message) update)
  (declare (ignore update))
  (tg-send-message bot
		   :text (format nil "got '~A' <span class=\"tg-spoiler\">spoiler</span> " (text message))
		   :parse-mode "html"
		   :chat-id (id (chat message))))

(defclass button-bot (bot) ())

(defun number-pad-and-content (number)
  (let ((plus-button (make-instance 'inline-keyboard-button
				    :text "-"
				    :callback-data
				    (format nil "~a" (1- number))))
	(minus-button (make-instance 'inline-keyboard-button
				    :text "+"
				    :callback-data
				    (format nil "~a" (1+ number))))
	(reset-button (make-instance 'inline-keyboard-button
				    :text "reset"
				    :callback-data "0")))

    (values
     (format nil "The value is ~a" number)
     (make-instance 'inline-keyboard-markup
				     :inline-keyboard
				     (list (list plus-button minus-button)
					   (list reset-button))))))

(defmethod handle-update ((bot button-bot) (message message) update)
  (multiple-value-bind (text keyboard) (number-pad-and-content 0)
    (tg-send-message bot
		     :text text
		     :chat-id (id (chat message))
		     :parse-mode "Markdown"
		     :reply-markup keyboard)))

(defmethod handle-update ((bot button-bot) (query callback-query) update)
  (let ((number (read-from-string (data query)))
	(message (message query)))
    (multiple-value-bind (text keyboard) (number-pad-and-content number)
      (unless (equalp (text message) text)
	(tg-edit-message-text bot
			      :text text
			      :chat-id (id (chat message))
			      :message-id (message-id message)
			      :parse-mode "Markdown"
			      :reply-markup keyboard)))))
