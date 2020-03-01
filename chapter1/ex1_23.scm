(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
			((divides? test-divisor n) test-divisor)
			(else (find-divisor n (next test-divisor)))))
(define (next a)
	(if (= a 2) 3
		(+ a 2)))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
	(= n (smallest-divisor n)))

(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (runtime)))
(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (search-for-primes first last)
	(define (search-iter cur last)
		(if (<= cur last) (timed-prime-test cur))
		(if (<= cur last) (search-iter (+ cur 2) last)))
	(search-iter (if (even? first) (+ first 1) first)
					(if (even? last) (- last 1) last)))