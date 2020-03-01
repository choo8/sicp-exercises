(define dx 0.00001)
(define (compose f g)
	(lambda (x) (f (g x))))
(define (repeated f n)
	(define (recur-repeated f end-f count)
		(if (> count n)
			end-f
			(recur-repeated f (compose f end-f) (+ count 1))))
	(recur-repeated f (lambda (x) x) 1))
(define (smooth f)
	(lambda (x) (/ (+ (f (- x dx)) (f x) (f * (+ x dx))) 3)))
(define (n-fold-smooth f n)
	((repeated smooth n) f))