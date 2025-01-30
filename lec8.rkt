(define (func1 x) (+ x 2))

(define (func2 y) (y 3))

;passing func1 as arg to func2 (higher order function).
(func2 func1)
;(func2 6); -> return application error
;eval eval eval apply can eval but can't apply.
;(6 3) -> then can eval that after applied


;substituion model for (func2 func1)
; (func1 3)
; (+ 3 2)
; 5


;(define + -)
;now when using + actually bound it to the minus sign which is just a procedure.

;my way iterative
#|(define (sum a b)
  (define (sum-iter ctr ind)
    (if (> ctr b)
        ind
        (sum-iter (+ 1 ctr) (+ ctr ind))))
  (sum-iter a 0))

(sum 1 100) |#

;recursion way - base case a > b then add a to result and increment it by 1 and call function again.
(define (sum-int a b)
  (if (> a b)
      0
      (+ a (sum-int (+ 1 a) b))))
(sum-int 1 100)


;sum of cubes same thing just cube the result.
(define (sum-cube a b)
  (define (cube a) (* a a a))
  (if (> a b)
      0
      (+ (cube a) (sum-cube (+ 1 a) b))))
(sum-cube 1 100)


;sum of PI
; converges to pi/8
; 1/(a * (a+2)) a starts as 1. and then a increases by 4
(define (sum-pi a b)
  (define (pi-term a)(/ 1.0 (* a (+ a 2))))
  (define (pi-next a)(+ a 4))
  (if (> a b)
      0
      (+ (pi-term a) (sum-pi (pi-next a) b))))
;diff of deviding whole 1.0 and decimal 1 (just 1 will give fraction) 1.0 will give float

(* 8 (sum-pi 1 100)) ;have to do the thing then * 8 to approximate and increasing b does a more accurate approx.

;the pattern just summing things, we sum a differently and icrement a differtntly.
;so defined pi-term to calc a, and pi-next to get the next a
;can now do a generealization

(define (sum a b term next)
(if (> a b)
0
(+ (term a) (sum (next a) b term next))))

;returns the value passed
(define (identity a) a)

(define (sum-next a) (+ 1 a))

(sum 1 100 identity sum-next)

; (+ (identity a) (sum (sum-next a) b identity sum-next))
;(+ (identity 1) (sum ((+ a 1) 1) 100 identity sum-next)
;(+ (identity 1) (sum (+ 1 1) 100 identity sum-next)
;(+ (identity 1) (sum (2 100 identity sum-next) ;does not do identity until it comes back from the stack and pops off.


(define (sum-int a b)
  (define (identity a) a)
  (define (sum-next a) (+ 1 a))
  (sum 1 100 identity sum-next)) ;just call the abstracted sum and do everything all over again.
;pattern abstarcted
(sum-int 1 100)

;Lambdas/anonymous procedures
;let/define is syntactic sugar for let and define.

;back to sum-int do we need to define identity and inc? now we have symbols bound to them.
;have 2 defs we never going to use can we pass anon funcs?
;USE ON A2 Q2

;what happens? returned a procedure!
(lambda () (+ 3 4))
;now what will this do? the lambda returns a procedure so it will be in brackets and it will run it (eval) and get 7
((lambda () (+ 3 4))) ;7 because of the extra bracekts apply.

+ 2 3;eval procedure
(+ 2 3);with brackets it will apply.

;procedure with param what will happen when run? -> return procedure
(lambda (x) (+ x 3))
((lambda (x) (+ x 3)) 4) ;just put the val outside
;return 4 (param from outside sub 4 into x
;labda (4)  (+4 3)
;(+ 4 3)
;7
