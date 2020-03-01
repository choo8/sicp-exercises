(define (f-recur n)
	(if (< n 3) 
		n
		(+ (f-recur (- n 1)) 
			(* 2 (f-recur (- n 2))) 
			(* 3 (f-recur (- n 3))))))

(define (f-iter-helper a b c n)
	(cond ((= n 1) c)
			((= n 2) b)
			((= n 3) a)
			(else (f-iter-helper (+ a 
									(* 2 b) 
									(* 3 c)) 
								a 
								b 
								(- n 1)))))

(define (f-iter n) (f-iter-helper 3 2 1 n))