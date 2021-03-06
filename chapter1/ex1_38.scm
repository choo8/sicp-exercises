(define (cont-frac N D k)
	(define (iter-cont-frac count accumulate)
		(cond ((< count 1) accumulate)
				(else (iter-cont-frac (- count 1) (/ (N count) (+ (D count) accumulate))))))
	(iter-cont-frac k 0))
(define (euler-D i)
	(if (< i 3)
		i
		(if (and (= (euler-D (- i 1)) 1) (= (euler-D (- i 2)) 1))
			(+ 2 (euler-D (- i 3)))
			1)))
(define (approx-e n)
	(+ 2.0 (cont-frac (lambda (i) 1.0) euler-D n)))