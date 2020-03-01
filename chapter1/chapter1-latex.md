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
[Solution](./ex1_3.scm)

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

The new [solution](./ex1_7.scm) works better well for both small and large numbers.

## Exercise 1.8
[Solution](./ex1_8.scm)

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

For `(define (f n) (A 0 n))`, `(f n)` computes <img src="svgs/47c124971e1327d1d3882a141f95face.svg" align=middle width=18.018495pt height=21.10812pt/>. For `(define (g n) (A 1 n))`, `(g n)` computes <img src="svgs/f8f25e4580c418a51dc556db0d8d2b93.svg" align=middle width=16.28418pt height=21.802439999999976pt/>. For `(define (h n) (A 2 n))`, `(h n)` computes <img src="svgs/b771320d1eb2ce194e670d4e14c9f3de.svg" align=middle width=42.257985pt height=53.95137pt/>.

## Exercise 1.11
[Solution](./ex1_11.scm)

## Exercise 1.12
[Solution](./ex1_12.scm)

## Exercise 1.13
We will prove <img src="svgs/871c975318ba26a2f4c3853f836c0a60.svg" align=middle width=115.307445pt height=31.63940999999999pt/>, where <img src="svgs/6cffa3b429b95cd03044fd558b5bd250.svg" align=middle width=67.596045pt height=33.20525999999999pt/> and <img src="svgs/47e54b5e9b5f11c32c44b05ff4f04672.svg" align=middle width=69.278385pt height=33.20525999999999pt/>, using induction and the definition of Fibonacci numbers. <br>

Base case: <br>
<p align="center"><img src="svgs/fdcf85d4bbadf95f8a881e897ad2f2f3.svg" align=middle width=192.14579999999998pt height=227.4921pt/></p>

Inductive Step: Assume the induction hypothesis <img src="svgs/9e894cd31ed0bf8a806e6439e18bf9c3.svg" align=middle width=114.52089pt height=31.63940999999999pt/> holds true for all natural numbers <img src="svgs/937d867d9b3d53c96323a9b2d9eb895f.svg" align=middle width=39.101865pt height=22.745910000000016pt/>, then <img src="svgs/47254cc0748efff66781d00e7d91473e.svg" align=middle width=75.497895pt height=24.56552999999997pt/> is also true.
<p align="center"><img src="svgs/ccf336aba30172015bec93a68b83fe57.svg" align=middle width=353.39865pt height=351.84105pt/></p>

<p align="center"><img src="svgs/b7613b9d4641427cdd9f17c605d83c95.svg" align=middle width=186.23219999999998pt height=170.91855pt/></p>

Since <img src="svgs/f4c41f8f1c3b7dd48f48efefb18aefa1.svg" align=middle width=60.790290000000006pt height=31.63940999999999pt/> for all <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.830040000000002pt height=14.102549999999994pt/>, <img src="svgs/cf7ca0f9bc62acfa986921e9aa8c2c4f.svg" align=middle width=48.052620000000005pt height=24.56552999999997pt/> is the closest integer to <img src="svgs/cfa069674b2af4fbeee9a86152ac1fa5.svg" align=middle width=17.351729999999996pt height=31.63940999999999pt/>.

## Exercise 1.14
<center><img src="./svgs/tree.svg"/></center>

### Orders of Growth of Space
Looking at the tree, we can see the maximum height of the tree grows linearly with <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.830040000000002pt height=14.102549999999994pt/>, hence it has a <img src="svgs/272e3ab168729ac17efd78e4c03be40f.svg" align=middle width=35.30538pt height=24.56552999999997pt/> order of growth.

### Orders of Growth of Number of Steps
Looking at the tree, when at `(cc n 1)`, we only have 1 kind of coin, with the value 1. We can count the number of calls to the procedure `cc`, with <img src="svgs/383821d4b13ac575f1bbeba070727876.svg" align=middle width=49.898475pt height=24.56552999999997pt/> as the cost in terms of time for `(cc n 1)`:
<p align="center"><img src="svgs/256419f68562d6b0b557e39cd0c21192.svg" align=middle width=118.18702499999999pt height=41.03451pt/></p>

Next, looking at `(cc n 2)`, we now have 2 kinds of coins, with the values 1 and 5. We apply a similar analysis:
<p align="center"><img src="svgs/b3c0c613e77f47d26b5c9f216556dda2.svg" align=middle width=219.40545pt height=90.369675pt/></p>

We can now see a pattern emerging, where with coin denominations <img src="svgs/a2868dbfb2c20f84f02eccf9b085df07.svg" align=middle width=97.185165pt height=22.381919999999983pt/>:
<p align="center"><img src="svgs/d77c631f5aff6eb1356b81120d0870b5.svg" align=middle width=360.45405pt height=137.1315pt/></p>

Hence, for this problem, with 5 coin denominations, it has a <img src="svgs/6e5cd5548e78f324882b23f4b485d4e0.svg" align=middle width=42.67989pt height=26.70657pt/> order of growth.

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
`(sine a)` grows logarithmically in space and number of steps, <img src="svgs/f2f7b56e81fa53092673a3dd94c32652.svg" align=middle width=55.681395pt height=24.56552999999997pt/>.

<p align="center"><img src="svgs/92d4aedb921c9c3c8856d632adadaf75.svg" align=middle width=168.59535pt height=128.687295pt/></p>

where <img src="svgs/f9c4988898e7f532b9f826a75014ed3c.svg" align=middle width=14.944050000000002pt height=22.381919999999983pt/> is the number of times procedure `p` is applied when `(sine a)` is evaluated.

## Exercise 1.16
[Solution](./ex1_16.scm)

## Exercise 1.17
[Solution](./ex1_17.scm)

## Exercise 1.18
[Solution](./ex1_18.scm)

## Exercise 1.19
<p align="center"><img src="svgs/289a15a1fad69ec24359ae19c502d0e8.svg" align=middle width=643.4141999999999pt height=117.045555pt/></p>

Hence, <img src="svgs/179ffa2827ea2825902d859514e69433.svg" align=middle width=84.80769pt height=26.70657pt/> and <img src="svgs/9cb5f4a443b7661c9f4868ac5eb466bf.svg" align=middle width=93.18342pt height=26.70657pt/>.

[Solution](./ex1_19.scm)

## Exercise 1.20

### Normal-Order Evaluation
For the normal-order evaluation, there are <img src="svgs/5fbdb7d79d893df4c475fe72df203516.svg" align=middle width=159.362445pt height=21.10812pt/> `remainder` operations performed in the evaluation of the `if` predicate expressions and <img src="svgs/ecf4fe2774fd9244b4fd56f7e76dc882.svg" align=middle width=8.188554000000002pt height=21.10812pt/> `remainder` operations performed in the final evaluation of the `if` consequent expression.
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
For the applicative-order evaluation, there are <img src="svgs/ecf4fe2774fd9244b4fd56f7e76dc882.svg" align=middle width=8.188554000000002pt height=21.10812pt/> `remainder` operations performed in the operands of the `gcd` procedures.
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
[Solution](./ex1_22.scm)

Using the procedure, the three smallest primes larger than 100, 10000, 100000 and 1000000 are 1009, 1013 and 1019, 10007, 10009 and 10037, 100003, 100019 and 100043, 1000003, 1000033 and 1000037 respectively.

As the procedure runs too quickly to get a meaningful difference in timing for those results above, I ran the procedure on 1000000000, 10000000000, 100000000000 and 1000000000000. The timings that were recorded were approximately 0.03, 0.08, 0.26 and 1.05 respectively. For every order of 10 growth in <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.830040000000002pt height=14.102549999999994pt/>, there seems to be an approximately <img src="svgs/7991fd900bfa4b7fd8d28f5008f87ec7.svg" align=middle width=30.137085pt height=28.51133999999998pt/> growth in timing as well. The results are compatible with the notion that programs on the machine run in time proportional to the number of steps required for computation.

## Exercise 1.23
[Solution](./ex1_23.scm)

Using the new `next` procedure, the new algorithm runs about 1.5 to 1.7 times as fast as the old one, slightly under 2 times. Although the number of test steps are halved, the `next` procedure has to evaluate an additional `if` predicate expression every time it is called.

## Exercise 1.24
[Solution](./ex1_24.scm)

Using the `fast-prime?` procedure instead of the `prime?` procedure, the time taken to test for primes near 1000000 is about 0.02 and the time taken to test for primes near 1000000000000 is about 0.04, running the Fermat test 1000 times each time it is called. Since <img src="svgs/8bda18d586c5a42a138b54bc748dfe5d.svg" align=middle width=77.52904500000001pt height=26.70657pt/> and <img src="svgs/79471905a2c14083217299db29139eb9.svg" align=middle width=102.09457499999999pt height=26.70657pt/>, the data does indicate that it takes roughly twice as long for testing primes near 1000000 as compared to that at 1000.

## Exercise 1.25
If we were to use `fast-exp`, we would be potentially squaring very large numbers, if either `base` or `exp` is a large number. With the original implementation of `expmod`, we are able to limit the operand to the squaring operation to below the value of `m`. This would be faster arithmetic with arbitrarily long numbers is computationally expensive.

## Exercise 1.26
By writing the procedure that way, tree recursion would be performed instead of linear recursion. Since the depth of the call tree would be logarithmic in <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.830040000000002pt height=14.102549999999994pt/>, the execution time would be linear in <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.830040000000002pt height=14.102549999999994pt/>. The reason is that instead of recursing on the call once each time `exp` is even, it is instead called twice.

## Exercise 1.27
[Solution](./ex1_27.scm)

Trying the `full-fermat-test` procedures on the carmichael numbers 561, 1105, 1729, 2465, 2821, 6601, we have verified that the relationship <img src="svgs/e410118cdd8bd90feb4112ca433cea60.svg" align=middle width=16.752450000000003pt height=21.802439999999976pt/> is congruent to <img src="svgs/44bc9d542a92714cac84e01cbbb7fd61.svg" align=middle width=8.656725000000002pt height=14.102549999999994pt/> modulo <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.830040000000002pt height=14.102549999999994pt/> for all integers <img src="svgs/070029d1880c4812f3ae116db320f7e2.svg" align=middle width=40.35669pt height=17.657639999999976pt/>, for each of the carmichael numbers.

## Exercise 1.28
[Solution](./ex1_28.scm)

We have verified the procedure by testing with known primes such as 2 and 13, and also the carmichael numbers from previous questions.

## Exercise 1.29
[Solution](./ex1_29.scm)

Using the Simpson's Rule, we obtained much more accurate results:

`(simpsons-integral cube 0 1 100)` <br>
_Value: .24999999999999992_ <br>

`(simpsons-integral cube 0 1 1000)` <br>
_Value: .2500000000000002_ <br>

## Exercise 1.30
[Solution](./ex1_30.scm)

## Exercise 1.31
[Solution](./ex1_31.scm)

## Exercise 1.32
[Solution](./ex1_32.scm)

## Exercise 1.33
[Solution](./ex1_33.scm)

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
For <img src="svgs/8539410543f02002b864328921768b23.svg" align=middle width=91.41363pt height=27.720329999999983pt/> and <img src="svgs/6cffa3b429b95cd03044fd558b5bd250.svg" align=middle width=67.596045pt height=33.20525999999999pt/>,
<p align="center"><img src="svgs/036286e589753bf95d2780591ff1fc7c.svg" align=middle width=181.86794999999998pt height=335.8971pt/></p>

`(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)` <br>
_Value: 1.6180327868852458_ <br>

## Exercise 1.36
[Solution](./ex1_36.scm)

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

With average damping, the fixed point search for a solution to <img src="svgs/a1771ab65c5938142f1eedef87371efd.svg" align=middle width=72.26010000000001pt height=21.802439999999976pt/> converges much faster, from 36 steps taken to 12 steps taken.

## Exercise 1.37
For <img src="svgs/2b770e38396b79d71d79355b15df04b0.svg" align=middle width=75.00999pt height=22.381919999999983pt/> for all <img src="svgs/77a3b857d53fb44e33b53e4c8b68351a.svg" align=middle width=5.642109000000004pt height=21.602129999999985pt/>,
<p align="center"><img src="svgs/22da03e8b5c5187c791739fa3caaa6e6.svg" align=middle width=210.76109999999997pt height=195.52335pt/></p>

Solving for <img src="svgs/190083ef7a1625fbc75f243cffb9c96d.svg" align=middle width=9.780705000000003pt height=22.745910000000016pt/>, <img src="svgs/117d77640f3fb31a7c9619293cb0b110.svg" align=middle width=78.082125pt height=33.20525999999999pt/> or <img src="svgs/53b73d00aa4e10ce442b91ffbfe9569e.svg" align=middle width=44.269665pt height=33.20525999999999pt/>.

For <img src="svgs/0f7e4255b0481ace6d5c541f135cce53.svg" align=middle width=77.89947000000001pt height=33.20525999999999pt/>,
<p align="center"><img src="svgs/0c8cf4358289d8388ce08865dd20f2d7.svg" align=middle width=185.2587pt height=216.37935000000002pt/></p>

[Solution](./ex1_37.scm)

<img src="svgs/63bb9849783d01d91403bc9a5fea12a2.svg" align=middle width=9.041505pt height=22.745910000000016pt/> had to be 11 to get an approximation that is accurate to 4 decimal places.

## Exercise 1.38
[Solution](./ex1_38.scm)

## Exercise 1.39
[Solution](./ex1_39.scm)

## Exercise 1.40
[Solution](./ex1_40.scm)

## Exercise 1.41
[Solution](./ex1_41.scm)

`(double double)` causes the procedure `double` to be applied twice, and `(double (double double))` causes the procedure `double` to be applied four times. Hence, `((double (double double)) inc)` causes the procedure `inc` to be applied a total of 16 times (once to twice, to four times, to eight times, to sixteen times), resulting in the answer 21.  

`(((double (double double)) inc) 5)` <br>
_Value: 21_ <br>

## Exercise 1.42
[Solution](./ex1_42.scm)

## Exercise 1.43
[Solution](./ex1_43.scm)

## Exercise 1.44
[Solution](./ex1_44.scm)

## Exercise 1.45
[Solution](./ex1_45.scm)

Via some experiments, we can see that the minimum number of average damps required to compute the <img src="svgs/55a049b8f161ae7cfeb0197d75aff967.svg" align=middle width=9.830040000000002pt height=14.102549999999994pt/>th roots as a fixed-point search is <img src="svgs/24186bd052053877534af6513e56bd34.svg" align=middle width=52.72146000000001pt height=24.56552999999997pt/>.

## Exercise 1.46
[Solution](./ex1_46.scm)