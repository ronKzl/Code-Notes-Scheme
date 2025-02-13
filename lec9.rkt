;lambda syntax (lambda (<parameters>) <body>) -> returns a PROCEDURE OBJECT

;gives an anonym procedure, need an extra () to apply it bcs of eval -> apply
(lambda (x) (+ x 3))

;what happens when we do this
((lambda (x) (+ x 3)) 5)
;evals to (procedure 5); i.e procedure and then a literal, then apply procedure to literal
;apply 5 to procedure takes in as x
;(+ 5 3)
;8

;gives 12 evals both and then applies the 9 to procedure
((lambda (x) (+ x 3)) (+ 3 4 (* 2 1))) 
;substituion model
;(procedure (+ 3 4 (* 2 1))
;(procedure (+ 3 4 2))
;(procedure 9)
;(lambda (9) (+ 9 3))
;(+ 9 3)
;12

;without the extra brackets will just give a proceduere
(lambda (x) (+ x 3)) (+ 3 4 (* 2 1)) 

;both are the same thing - syntactic sugar
(define cube (lambda (x) (* x x x)))
(cube 3)
(define (cube2 x) (* x x x))
(cube 3)

;let is a sytactic sugar of lambda
( let ((i 3)
       (j 2)
       (k 1))
       (+ (* 3 i)(- j k)))

;with simple let can't do (i 3) then declare (j (+ i 2)) - will get i undefined.


((lambda (arg) (arg 2 3))(lambda (x y) (+ (* 2 x) y)))
;arg will be subded with the other lamda (lambda (x y) (+ (* 2 x) y))
; then (arg 2 3) becomes
;((lambda (x y) (+ (* 2 x) y)) 2 3)
;then we do the x = 2 y = 3
;and get 7


(define (func1 x)
((lambda (y)(if (< x y) x y)) 2));extra brackets helpful bcs we want to eval it

;gives 2 because it has the extra brackets to execute the lambda, if we don't have them
(func1 3)
;will return a procedure.

;closures
(define (multiplyBy x) ;multiply by returns a lambda
  (lambda (y) (* x y)))
;What will be the result? 2 procedures
(define double (multiplyBy 2))
;unwraps into (define double (lambda (y) (* 2 y)))
double
(define triple (multiplyBy 3))
triple

;the free var x remembered that it had 2 and 3 in it respectively on definition
;only other variable need to supply is y
(double 7)
(triple 7)

;make-adder - another closure
(define (make-adder x)
  (lambda (y) (+ x y)))

;enable Factory design pattern
(define add5 (make-adder 5))
(define add10 (make-adder 10))

(add5 3);8
(add10 3);13



