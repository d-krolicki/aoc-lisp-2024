(ql:quickload "split-sequence")

(defun day-2 (l1)
  
  (let ((safe-report-count 0)
	(unsafe nil)
	(increasing nil))
    (loop for sublist in l1 do
      (setf increasing nil)
      (when (= (nth 0 sublist) (nth 1 sublist)) (setf unsafe t)) ;; 
      (when (< (nth 0 sublist) (nth 1 sublist)) (setf increasing t))
      (format t "For numbers ~S, ~S increasing ~S~C"
	      (nth 0 sublist)
	      (nth 1 sublist)
	      increasing
	      #\Newline)
      (loop for index from 0 to (- (length sublist) 2) do
	(if unsafe
	    (return)
	    (if increasing
		(progn ;; check conditions for increasing
		  (when (not (and (> (nth (+ index 1) sublist) (nth index sublist))
				  (< (- (nth (+ index 1) sublist) (nth index sublist)))))
		    (format t "Pair ~S ~S broke ~C"
			    (nth index sublist)
			    (nth (+ index 1) sublist)
			    #\Newline)
		    (setf unsafe t)
		    (return)))
		(progn ;; check conditions for decreasing
		  (when (not (and (< (nth (+ index 1) sublist) (nth index sublist))
				  (< (- (nth index sublist) (nth (+ index 1) sublist)) 4)))
		    (format t "Pair ~S ~S broke ~C"
			    (nth index sublist)
			    (nth (+ index 1) sublist)
			    #\Newline)
		    (setf unsafe t)
		    (return))))))
      (if unsafe
	  (setf unsafe nil)
	  (progn
	    (format t "Report ~S is safe ~C"
		    sublist
		    #\Newline)
	    (incf safe-report-count)
	    (setf unsafe nil)))
	  (format t "~C" #\Newline))
    safe-report-count))

(defun day-2-p-1 (fpath)
  (let ((l1 '()))
    (with-open-file (stream fpath)
      (with-output-to-string (st)
	(loop for line = (read-line stream nil)
	      while line
	      do (push (mapcar #'parse-integer (split-sequence:split-sequence
						#\Space line
						:remove-empty-subseqs t))
		       l1))))
    (day-2 l1)))
