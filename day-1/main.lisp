(defun day-1-p-1 (fpath)
  (let ((l1 '())
	(l2 '())
	(flag t))
    (with-open-file (stream fpath)
      (with-output-to-string (st)	
	(loop for word = (read stream nil) while word do
	  (format st "~a" word)
	  (if (not (null flag))
	      (progn 
		(push word l1)
		(setf flag nil))
	      (progn 
		(push word l2)
		(setf flag t))))))
    (setf l1 (sort l1 '<))
    (setf l2 (sort l2 '<))
    (reduce '+ (mapcar 'abs (mapcar '- l1 l2)))))

(defun day-1-p-2 (fpath)
  (let ((cnt 0)
	(l1 '())
	(l2 '())
	(flag t))
    (with-open-file (stream fpath)
      (with-output-to-string (st)	
	(loop for word = (read stream nil) while word do
	  (format st "~a" word)
	  (if (not (null flag))
	      (progn 
		(push word l1)
		(setf flag nil))
	      (progn 
		(push word l2)
		(setf flag t))))))
    (setf l1 (sort l1 '<))
    (setf l2 (sort l2 '<))
    (loop for element in l1 do
      (incf cnt (* (count element l2) element)))
    cnt
    ))


(defparameter *a* (list 2 4 6 8))
(defparameter *b* (list 1 2 3 4))
(mapcar #'list *a* *b*)
