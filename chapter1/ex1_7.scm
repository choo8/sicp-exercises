(define (average x y)
	(/ (+ x y) 2))

(define (improve guess x)
	(average guess (/ x guess)))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
	(if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x) x)))

(define (sqrt x) 
	(sqrt-iter 1.0 x))

(define (new-good-enough? guess old-guess)
	(< (/ (abs (- guess old-guess)) old-guess) 0.0001))

(define (new-sqrt-iter guess old-guess x)
	(if (new-good-enough? guess old-guess)
		guess
		(new-sqrt-iter (improve guess x) guess x)))

(define (new-sqrt x)
	(new-sqrt-iter 1.0 2.0 x))