(define (fast-expt b n)
	(iter-fast-expt 1 b n))

(define (iter-fast-expt a b n)
	(cond ((= n 0) a)
			((even? n) (iter-fast-expt a (* b b) (/ n 2)))
			(else (iter-fast-expt (* a b) b (- n 1)))
		) 
)