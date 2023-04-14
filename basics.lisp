(defpackage clbleepblop
  (:use cl)
  (:export :bot :*default-tg-timeout* :*tg-debug* :*tg-api-verbose* :handle-update
	   :run-telegram-bot))

(in-package clbleepblop)

(defparameter *default-tg-timeout* 600)
(defparameter *tg-debug* nil)
(defparameter *tg-api-verbose* nil)

(defclass bot ()
  ((token :initarg :token :reader token)
   (user :reader bot-user)
   (strict-mode :accessor strict-mode :initarg :strict-mode :initform nil)))

(defmethod req-uri ((bot bot) method)
  (format nil "https://api.telegram.org/bot~A/~A" (token bot) method))
