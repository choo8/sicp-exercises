(define (improve guess x)
	(/ (+ (/ x (square guess)) 
		  (* 2.0 guess))
	   3.0))

(define (good-enough? guess old-guess)
	(< (/ (abs (- guess old-guess)) old-guess) 0.0001))

(define (cube-root-iter guess old-guess x)
	(if (good-enough? guess old-guess)
		guess
		(cube-root-iter (improve guess x) guess x)))

(define (cube-root x) 
	(cube-root-iter 1.0 2.0 x))