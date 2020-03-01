(define (average x y)
	(/ (+ x y) 2.0))
(define (average-damp f)
	(lambda (x) (average x (f x))))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2))
			tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))
(define (compose f g)
	(lambda (x) (f (g x))))
(define (repeated f n)
	(define (recur-repeated f end-f count)
		(if (> count n)
			end-f
			(recur-repeated f (compose f end-f) (+ count 1))))
	(recur-repeated f (lambda (x) x) 1))
(define (n-damp n)
	(floor (/ (log n) (log 2))))
(define (n-root x n)
	(define (x-over-yn y)
		(define (recur-x-over-yn val count)
			(if (> count (- n 1))
				val
				(recur-x-over-yn (/ val y) (+ count 1))))
		(recur-x-over-yn x 1))
	(fixed-point ((repeated average-damp (n-damp n)) x-over-yn) 1.0))