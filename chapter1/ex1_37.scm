(define (cont-frac N D k)
	(define (recur-cont-frac count)
		(if (> count k)
			0
			(/ (N count) (+ (D count) (recur-cont-frac (+ count 1))))))
	(recur-cont-frac 1))

(define (cont-frac N D k)
	(define (iter-cont-frac count accumulate)
		(cond ((< count 1) accumulate)
				(else (iter-cont-frac (- count 1) (/ (N count) (+ (D count) accumulate))))))
	(iter-cont-frac k 0))