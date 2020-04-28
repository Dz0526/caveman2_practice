(in-package :cl-user)
(defpackage caveman2_practice.web
  (:use :cl
        :caveman2
        :caveman2_practice.config
        :caveman2_practice.view
        :caveman2_practice.model
        :caveman2_practice.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :caveman2_practice.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

(defroute "/advice" ()
  (render-advice))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
