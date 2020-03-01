(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (iter-fast-mult a b acc)
	(cond ((= b 0) 0)
		((= b 1) (+ acc a))
		((even? b) (iter-fast-mult (double a) (halve b) acc)) 
		(else (iter-fast-mult (double a) (halve (- b 1)) (+ acc a)))))

(define (fast-mult a b) 
	(iter-fast-mult a b 0))