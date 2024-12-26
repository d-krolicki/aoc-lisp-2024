;;;; package.lisp

(ql:quickload (list "alexandria" "split-sequence" "cl-ppcre"))

(defpackage :aoc-2024
  (:use :cl :alexandria)
  (:import-from :uiop
   :read-file-lines)
  (:import-from :ppcre
   :all-matches-as-strings))
