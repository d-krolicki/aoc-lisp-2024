(in-package :aoc-2024)

(defun report-safep (report)
  (if (> (first report) (lastcar report))
      (report-safep (reverse report))
      (loop for (a b) on report
	    while b
	    always (<= 1 (- b a) 3))))

(defun remove-nth (n sequence)
  (append (subseq sequence 0 n)
	  (subseq sequence (1+ n))))

(defun string-to-num-list (string)
  (mapcar #'parse-integer (all-matches-as-strings "[\\d]+" string)))

(defun report-safe-with-dampener (report)
  (loop for level below (length report)
	;; do (format t "~S~%" (remove-nth level report))))
	  thereis (report-safep (remove-nth level report))))

(defun analyze-reports (fpath)
  (loop for report in (read-file-lines fpath)
	;do (format t "~S~%" (string-to-num-list report))))
	count (report-safe-with-dampener (string-to-num-list report))))

(loop for report in (read-file-lines "input.txt")
      count (report-safe-with-dampener (string-to-num-list report)))
