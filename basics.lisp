(defpackage clbleepblop
  (:use cl))

(in-package clbleepblop)

(defvar *default-timeout* 60)
(defvar *debug* nil)
(defvar *api-verbose* nil)

(defclass bot ()
  ((token :initarg :token :reader token)
   (user :reader bot-user)
   (strict-mode :accessor strict-mode :initarg :strict-mode :initform nil)))

(defmethod req-uri ((bot bot) method)
  (format nil "https://api.telegram.org/bot~A/~A" (token bot) method))
