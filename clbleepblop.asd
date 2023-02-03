(asdf:defsystem clbleepblop
    :serial t
    :components
  ((:file "basics") ;; defpackage, bot class
   (:file "meta-api") ;; the funcs to define apis
   (:file "api") ;; the scraped api
   (:file "infrastructure")) ;; bot initialize-instance, get updates, handle that
    :depends-on (:dexador :jonathan :alexandria :kebab))
