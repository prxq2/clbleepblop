(defpackage clbleepblop
  (:use cl)
  (:export :bot :*default-tg-timeout* :*tg-debug* :*tg-api-verbose* :handle-update
	   :run-telegram-bot))

(in-package clbleepblop)

(defvar *default-tg-timeout* 60)
(defvar *tg-debug* nil)
(defvar *tg-api-verbose* nil)

(defclass bot ()
  ((token :initarg :token :reader token)
   (user :reader bot-user)
   (strict-mode :accessor strict-mode :initarg :strict-mode :initform nil)))

(defmethod req-uri ((bot bot) method)
  (format nil "https://api.telegram.org/bot~A/~A" (token bot) method))
