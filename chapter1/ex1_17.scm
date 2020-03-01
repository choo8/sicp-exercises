(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (fast-mult a b)
	(cond ((= b 0) 0)
		((even? b) (fast-mult (double a) (halve b))) 
		(else (+ a (fast-mult a (- b 1))))))