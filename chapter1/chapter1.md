# Solutions for Chapter 1

## Exercise 1.1

`10` <br>
_Value: 10_ <br>

`(+ 5 3 4)` <br>
_Value: 12_ <br>

`(- 9 1)` <br>
_Value: 8_ <br>

`(/ 6 2)` <br>
_Value: 3_ <br>

`(+ (* 2 4) (- 4 6))` <br>
_Value: 6_

`(define a 3)` <br>
_Value: a_ <br>

`(define b (+ a 1))` <br>
_Value: b_ <br>

`(+ a b (* a b))` <br>
_Value: 19_ <br>

`(= a b)` <br>
_Value: #f_ <br>

```
(if (and (> b a) (< b (* a b)))
    b
    a)
```
_Value: 4_ <br>

```
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
```
_Value: 16_ <br>

`(+ 2 (if (> b a) b a))` <br>
_Value: 6_ <br>

```
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
```
_Value: 16_ <br>

## Exercise 1.2
```
(/ (+ 5 4 (- 2 (- 3 (+ 6 4/5))))
   (* 3 (- 2 6) (-2 7)))
```

## Exercise 1.3
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_3.scm)

## Exercise 1.4
```
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```
In this procedure, the expression `(if (> b 0) + -)` evaluates to be the `+` operator if b is positive and evaluates to the `-` operator if b is negative. This would result in the procedure returning the value a + abs(b).

## Exercise 1.5
```
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
```
Evaluating `(test 0 (p))` in the normal-order evaluation would result in the value 0. However, when evaluating it in the applicative-order evaluation, it will not terminate. In the normal-order evaluation, `(test 0 (p))` will be expanded to `(if (= 0 0) 0 (p))` and then the predicate expression will be evaluated to return the value 0. However, for the applicative-order evaluation, the arguments will be evaluated before `test` is called, and since `(p)` is defined as `(define (p) (p))`, evaluation of `(p)` will not complete, and neither will the evaluation of `(test 0 (p))`.

## Exercise 1.6
Using the new version of if, the function will recurse infinitely in Scheme. Because `new-if` is a procedure, its arguments are evaluated first as Scheme employs an applicatve-order evaluation. Since `sqrt-iter` is an argument of `new-if`, to evaluate it, it will result in another call to `new-if` which leads to another call to `sqrt-iter`, resulting in an infinite recursion. This does not happen if `if` is provided as a special form. When the predicate, `(good-enough? guess x)` is true, `if` will return the consequent without evaluating the alternative, hence the function will terminate at some point.

## Exercise 1.7
When finding the square roots of small numbers, the tolerance used may be large relative to the small numbers. For example, using the square root of 0.0001 using the `sqrt-iter` and tolerance value of 0.0001 will result in 0.03230844833048122, which is about a 200% error rate as the correct answer is 0.01.

For very large numbers, due to the limited machine precision when performing arithmetic operations, the algorithm may be stuck trying to get a guess that has a square within 0.0001 of the radicand. For example, when calculating the square root of 1000000000000, the function returns almost immediately with the value of 1000000. However, when calculating the square root of 1000000000000 (one more zero than the previous value), the function gets stuck in an infinite loop. These experiments are run on a 64-bit Ubuntu 16.04 virtual machine.

The new [solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_7.scm) works better well for both small and large numbers.

## Exercise 1.8
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_8.scm)

## Exercise 1.9
For the first procedure, it is recursive:
```
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5)))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9
```

For the second procedure, it is iterative:
```
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
```

## Exercise 1.10
`(A 1 10)` <br>
_Value: 1024_ <br>

`(A 2 4)` <br>
_Value: 65536_ <br>

`(A 3 3)` <br>
_Value: 65536_ <br>

For `(define (f n) (A 0 n))`, `(f n)` computes $2n$. For `(define (g n) (A 1 n))`, `(g n)` computes $2^n$. For `(define (h n) (A 2 n))`, `(h n)` computes $\underbrace{2^{2^{.^{.^{.^2}}}}}_\text{n times}$.

## Exercise 1.11
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_11.scm)

## Exercise 1.12
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_12.scm)

## Exercise 1.13
We will prove $Fib(n) = \frac{\phi^n - \psi^n}{\sqrt{5}}$, where $\phi = \frac{1 + \sqrt{5}}{2}$ and $\psi = \frac{1 - \sqrt{5}}{2}$, using induction and the definition of Fibonacci numbers. <br>

Base case: <br>
$$
\begin{align*}
Fib(0) &= \frac{\phi^0 - \psi^0}{\sqrt{5}} \\
        &= \frac{1 - 1}{\sqrt{5}} \\
        &= 0 \\
Fib(1) &= \frac{\phi^1 - \psi^1}{\sqrt{5}} \\
        &= \frac{(\frac{1 + \sqrt{5}}{2}) - (\frac{1 - \sqrt{5}}{2})}{\sqrt{5}} \\
        &= 1 \\
\end{align*}$$

Inductive Step: Assume the induction hypothesis $Fib(k) = \frac{\phi^n - \psi^n}{\sqrt{5}}$ holds true for all natural numbers $k \geq 0$, then $Fib(k+1)$ is also true.
$$
\begin{align*}
Fib(k+1) &= Fib(k-1) + Fib(k) \\
          &= \frac{\phi^{k-1} - \psi^{k-1}}{\sqrt{5}} + \frac{\phi^k - \psi^k}{\sqrt{5}} \\
          &= \frac{\phi^{k-1} + \phi^k}{\sqrt{5}} - \frac{\psi^{k-1} + \psi^k}{\sqrt{5}} \\
          &= \frac{\phi^{k-1}(1 + \phi)}{\sqrt{5}} - \frac{\psi^{k-1}(1 + \psi)}{\sqrt{5}} \\
          &= \frac{\phi^{k-1}(1 + \frac{1 + \sqrt{5}}{2})}{\sqrt{5}} - \frac{\psi^{k-1}(1 + \frac{1 - \sqrt{5}}{2})}{\sqrt{5}} \\
          &= \frac{\phi^{k-1}(6 + 2\sqrt{5}{4})}{\sqrt{5}} - \frac{\psi^{k-1}(6 - 2\sqrt{5}{4})}{\sqrt{5}} \\ 
          &= \frac{\phi^{k-1}\phi^2}{\sqrt{5}} - \frac{\psi^{k-1}\psi^2}{\sqrt{5}} \\
          &= \frac{\phi^{k+1} - \psi^{k+1}}{\sqrt{5}} \\
\end{align*}$$

$$
\begin{align*}
Fib(n) &= \frac{\phi^n - \psi^n}{\sqrt{5}} \\
Fib(n) - \frac{\psi^n}{\sqrt{5}} &= -\frac{\phi^n}{\sqrt{5}} \\
\lvert Fib(n) - \frac{\psi^n}{\sqrt{5}} \rvert &= \lvert -\frac{\phi^n}{\sqrt{5}} \rvert \\
\lvert Fib(n) - \frac{\psi^n}{\sqrt{5}} \rvert &= \lvert \frac{\phi^n}{\sqrt{5}} \rvert
\end{align*}$$

Since $\lvert \frac{\phi^n}{\sqrt{5}} \rvert < \frac{1}{2}$ for all $n$, $Fib(n)$ is the closest integer to $\frac{\psi^n}{\sqrt{5}}$.

## Exercise 1.14
<center><img src="/home/joshua/sicp-exercises/chapter1/svgs/test-354.svg"/></center>

### Orders of Growth of Space
Looking at the tree, we can see the maximum height of the tree grows linearly with $n$, hence it has a $\Theta(n)$ order of growth.

### Orders of Growth of Number of Steps
Looking at the tree, when at `(cc n 1)`, we only have 1 kind of coin, with the value 1. We can count the number of calls to the procedure `cc`, with $T(n,1)$ as the cost in terms of time for `(cc n 1)`:
$$
\begin{align*}
T(n,1) &= 2n+1 \\
      &= \Theta(n) \\
\end{align*}$$

Next, looking at `(cc n 2)`, we now have 2 kinds of coins, with the values 1 and 5. We apply a similar analysis:
$$
\begin{align*}
T(n,2) &= \lfloor\frac{n}{5}\rfloor(T(n,1) + 1) + 2 \\
      &= \lfloor\frac{n}{5}\rfloor(2n + 2) + 2 \\
      &= \Theta(n^2) \\
\end{align*}$$

We can now see a pattern emerging, where with coin denominations $C_1, C_2, ..., C_K$:
$$
\begin{align*}
T(n,k) &= \lfloor\frac{n}{C_k}\rfloor(T(n,k-1) + 1) + 2 \\
      &= \lfloor\frac{n}{C_k}\rfloor(\lfloor\frac{n}{C_{k-1}}\rfloor(T(n,k-2) + 1) + 1) + 2 \\
      &= \lfloor\frac{n}{C_k}\rfloor(\lfloor\frac{n}{C_{k-1}}\rfloor(\ldots \lfloor\frac{n}{C_2}\rfloor(2n + 1) \ldots)) + 2 \\
      &= \Theta(n^k) \\
\end{align*}$$

Hence, for this problem, with 5 coin denominations, it has a $\Theta(n^5)$ order of growth.

## Exercise 1.15

### Part a
`(sine 12.15)` expands in the following way:
```
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
```
Hence, `p` is applied 5 times when `(sine 12.15)` is evaluated.

### Part b
`(sine a)` grows logarithmically in space and number of steps, $\Theta(log a)$.

$$
\begin{align*}
a &= 0.1 * (3 ^ N) \\
\frac{a}{0.1} &= 3 ^ N \\
log_3(\frac{a}{0.1}) &= N \\
N &\approx \lceil log_3(\frac{a}{0.1}) \rceil \\
\end{align*}$$

where $N$ is the number of times procedure `p` is applied when `(sine a)` is evaluated.

## Exercise 1.16
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_16.scm)

## Exercise 1.17
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_17.scm)

## Exercise 1.18
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_18.scm)

## Exercise 1.19
$$
\begin{align*}
T_{pq}(a,b) &= (bq + aq + ap, bp + aq) \\
T_{p'q'}(a,b) &= T_{pq}(T_{pq}(a,b)) \\
              &= T_{pq}(bq + aq + ap, bp + aq) \\
              &= ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p, (bp + aq)p + (bq + aq + ap)q) \\
              &= (b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2), b(p^2 + q^2) + a(2pq + q^2)) \\
\end{align*}$$

Hence, $p' = p^2 + q^2$ and $q' = 2pq + q^2$.

[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_19.scm)

## Exercise 1.20

### Normal-Order Evaluation
For the normal-order evaluation, there are $0 + 1 + 2 + 4 + 7 = 14$ `remainder` operations performed in the evaluation of the `if` predicate expressions and $4$ `remainder` operations performed in the final evaluation of the `if` consequent expression.
```
(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= 6 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= (remainder 40 6) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= 4 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ...)
(if (= 2 0) ...)
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ...)
(if (= 0 0) ...)
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
```

### Applicative-Order Evaluation
For the applicative-order evaluation, there are $4$ `remainder` operations performed in the operands of the `gcd` procedures.
```
(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
(gcd 40 (remainder 206 40))
(gcd 40 6)
(if (= 6 0) 40 (gcd 6 (remainder 40 6)))
(gcd 6 (remainder 40 6))
(gcd 6 4)
(if (= 4 0) 6 (gcd 4 (remainder 6 4)))
(gcd 4 (remainder 6 4))
(gcd 4 2)
(if (= 2 0) 4 (gcd 2 (remainder 4 2)))
(gcd 2 (remainder 4 2))
(gcd 2 0)
(if (= 0 0) 2 (gcd 0 (remainder 2 0)))
2
```

## Exercise 1.21
`(smallest-divisor 199)` <br>
_Value: 199_ <br>

`(smallest-divisor 1999)` <br>
_Value: 1999_ <br>

`(smallest-divisor 19999)` <br>
_Value: 7_ <br>

## Exercise 1.22
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_22.scm)

Using the procedure, the three smallest primes larger than 100, 10000, 100000 and 1000000 are 1009, 1013 and 1019, 10007, 10009 and 10037, 100003, 100019 and 100043, 1000003, 1000033 and 1000037 respectively.

As the procedure runs too quickly to get a meaningful difference in timing for those results above, I ran the procedure on 1000000000, 10000000000, 100000000000 and 1000000000000. The timings that were recorded were approximately 0.03, 0.08, 0.26 and 1.05 respectively. For every order of 10 growth in $n$, there seems to be an approximately $\sqrt{10}$ growth in timing as well. The results are compatible with the notion that programs on the machine run in time proportional to the number of steps required for computation.

## Exercise 1.23
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_23.scm)

Using the new `next` procedure, the new algorithm runs about 1.5 to 1.7 times as fast as the old one, slightly under 2 times. Although the number of test steps are halved, the `next` procedure has to evaluate an additional `if` predicate expression every time it is called.

## Exercise 1.24
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_24.scm)

Using the `fast-prime?` procedure instead of the `prime?` procedure, the time taken to test for primes near 1000000 is about 0.02 and the time taken to test for primes near 1000000000000 is about 0.04, running the Fermat test 1000 times each time it is called. Since $1000 = 10^3$ and $1000000 = 10^6$, the data does indicate that it takes roughly twice as long for testing primes near 1000000 as compared to that at 1000.

## Exercise 1.25
If we were to use `fast-exp`, we would be potentially squaring very large numbers, if either `base` or `exp` is a large number. With the original implementation of `expmod`, we are able to limit the operand to the squaring operation to below the value of `m`. This would be faster arithmetic with arbitrarily long numbers is computationally expensive.

## Exercise 1.26
By writing the procedure that way, tree recursion would be performed instead of linear recursion. Since the depth of the call tree would be logarithmic in $n$, the execution time would be linear in $n$. The reason is that instead of recursing on the call once each time `exp` is even, it is instead called twice.

## Exercise 1.27
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_27.scm)

Trying the `full-fermat-test` procedures on the carmichael numbers 561, 1105, 1729, 2465, 2821, 6601, we have verified that the relationship $a^n$ is congruent to $a$ modulo $n$ for all integers $a < n$, for each of the carmichael numbers.

## Exercise 1.28
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_28.scm)

We have verified the procedure by testing with known primes such as 2 and 13, and also the carmichael numbers from previous questions.

## Exercise 1.29
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_29.scm)

Using the Simpson's Rule, we obtained much more accurate results:

`(simpsons-integral cube 0 1 100)` <br>
_Value: .24999999999999992_ <br>

`(simpsons-integral cube 0 1 1000)` <br>
_Value: .2500000000000002_ <br>

## Exercise 1.30
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_30.scm)

## Exercise 1.31
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_31.scm)

## Exercise 1.32
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_32.scm)

## Exercise 1.33
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_33.scm)

## Exercise 1.34
The combination `(f f)` would lead to an error _The object 2 is not applicable_. This is because the expansion, for both applicative-order and normal-order evaluation, will result in `(2 2)` and `2` is not a procedure.

Normal-Order Evaluation:
```
(f f)
(f 2)
(2 2)
```

Applicative-Order Evaluation:
```
(f f)
(f (lambda (g) (g 2)))
((lambda (g) (g 2)) 2)
(2 2)
```

## Exercise 1.35
For $f(x) = 1 + \frac{1}{x}$ and $\phi = \frac{1 + \sqrt{5}}{2}$,
$$
\begin{align*}
f(x) &= 1 + \frac{1}{x} \\
      &= 1 + \frac{1}{\frac{1 + \sqrt{5}}{2}} \\
      &= 1 + \frac{2}{1 + \sqrt(5)} \\
      &= \frac{1 + \sqrt{5} + 2}{1 + \sqrt{5}} \\
      &= \frac{(3 + \sqrt{5})(1 - \sqrt{5})}{1 - 5} \\
      &= \frac{-2 - 2\sqrt{5}}{-4} \\
      &= \frac{1 + \sqrt{5}}{2} \\
      &= \phi (Shown) \\
\end{align*}$$

`(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)` <br>
_Value: 1.6180327868852458_ <br>

## Exercise 1.36
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_36.scm)

Without Average Damping:
`(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.5)` <br>
_1.5_ <br>
_17.036620761802716_ <br>
_2.436284152826871_ <br>
_7.7573914048784065_ <br>
_3.3718636013068974_ <br>
_5.683217478018266_ <br>
_3.97564638093712_ <br>
_5.004940305230897_ <br>
_4.2893976408423535_ <br>
_4.743860707684508_ <br>
_4.437003894526853_ <br>
_4.6361416205906485_ <br>
_4.503444951269147_ <br>
_4.590350549476868_ <br>
_4.532777517802648_ <br>
_4.570631779772813_ <br>
_4.545618222336422_ <br>
_4.562092653795064_ <br>
_4.551218723744055_ <br>
_4.558385805707352_ <br>
_4.553657479516671_ <br>
_4.55677495241968_ <br>
_4.554718702465183_ <br>
_4.556074615314888_ <br>
_4.555180352768613_ <br>
_4.555770074687025_ <br>
_4.555381152108018_ <br>
_4.555637634081652_ <br>
_4.555468486740348_ <br>
_4.555580035270157_ <br>
_4.555506470667713_ <br>
_4.555554984963888_ <br>
_4.5555229906097905_ <br>
_4.555544090254035_ <br>
_4.555530175417048_ <br>
_Value: 4.555539351985717_ <br>

With Average Damping:
`(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.5)` <br>
_1.5_ <br>
_9.268310380901358_ <br>
_6.185343522487719_ <br>
_4.988133688461795_ <br>
_4.643254620420954_ <br>
_4.571101497091747_ <br>
_4.5582061760763715_ <br>
_4.555990975858476_ <br>
_4.555613236666653_ <br>
_4.555548906156018_ <br>
_4.555537952796512_ <br>
_Value: 4.555536087870658_ <br>

With average damping, the fixed point search for a solution to $x^{x} = 1000$ converges much faster, from 36 steps taken to 12 steps taken.

## Exercise 1.37
For $N_i, D_i = 1$ for all $i$,
$$
\begin{align*}
f &= \frac{N_1}{D_1 + \frac{N_2}{D_2 + \frac{N_3}{D_3 + ...}}} \\
  &= \frac{1}{1 + \frac{1}{1 + \frac{1}{1 + ...}}} \\
  &= \frac{1}{1 + f} \\
f(1 + f) &= 1 \\
f^2 + f - 1 &= 0 \\
\end{align*}$$

Solving for $f$, $f = \frac{-1 - \sqrt{5}}{2}$ or $\frac{-1 + \sqrt{5}}{2}$.

For $f = \frac{-1 + \sqrt{5}}{2}$,
$$
\begin{align*}
f &= \frac{-1 + \sqrt{5}}{2} \\
  &= \frac{(-1 + \sqrt{5})(-1 - \sqrt{5})}{2(-1 - \sqrt{5})} \\
  &= \frac{1 - 5}{-2 - 2\sqrt{5}} \\
  &= \frac{2}{1 + \sqrt{5}} \\
  &= \frac{1}{\phi} (Shown) \\
\end{align*}$$

[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_37.scm)

$k$ had to be 11 to get an approximation that is accurate to 4 decimal places.

## Exercise 1.38
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_38.scm)

## Exercise 1.39
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_39.scm)

## Exercise 1.40
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_40.scm)

## Exercise 1.41
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_41.scm)

`(double double)` causes the procedure `double` to be applied twice, and `(double (double double))` causes the procedure `double` to be applied four times. Hence, `((double (double double)) inc)` causes the procedure `inc` to be applied a total of 16 times (once to twice, to four times, to eight times, to sixteen times), resulting in the answer 21.  

`(((double (double double)) inc) 5)` <br>
_Value: 21_ <br>

## Exercise 1.42
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_42.scm)

## Exercise 1.43
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_43.scm)

## Exercise 1.44
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_44.scm)

## Exercise 1.45
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_45.scm)

Via some experiments, we can see that the minimum number of average damps required to compute the $n$th roots as a fixed-point search is $\lfloor log_{2}n \rfloor$.

## Exercise 1.46
[Solution](https://github.com/choo8/sicp-exercises/blob/master/chapter1/ex1_46.scm)