(in-package :cl-user)
(defpackage caveman2_practice.model
  (:use :cl)
  (:import-from :caveman2_practice.config
                :*template-directory*)
  (:shadowing-import-from :dexador
                :get)
  (:import-from :jonathan
                :parse) 
  (:export :advice_list))

(in-package :caveman2_practice.model)


(defun advice () 
  (let ((s (jojo:parse (dex:get "https://api.adviceslip.com/advice"))))
    (getf (getf s ':|slip|) ':|advice|)))

(defun url (str)
  (defparameter *advice* (advice))
  (let ((s (concatenate 'string "https://script.google.com/macros/s/AKfycbzZtvOvf14TaMdRIYzocRcf3mktzGgXvlFvyczo/exec?text=" str "&source=en&target=ja")))
   (cl-ppcre:regex-replace-all " "
                               s
                               "%20")))

(defun advice_trans ()
  (let ((s (jojo:parse (dex:get (url *advice*)))))
    (getf s ':|text|)))

(defun advice_list ()
  (list *advice* (advice_trans)))




