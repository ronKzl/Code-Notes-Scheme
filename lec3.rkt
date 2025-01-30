(define (square x) (* x x))
;(square 4) ;16

(define (sum-sqr x y)(+ (square x) (square y)))
;(sum-sqr 5 2) ;29

; f(5) -> 136 
(define (f a) (sum-sqr (+ a 1) (* a 2)))

(define (cube x) (* x x x))
(cube 3)

(define (sum-cube x y) (+ (cube x) (cube y)))
(sum-cube 2 3)

(define (double-sum x y) (* 2 (+ x y)))
(double-sum 5 7)

(define (sum x y) ;display has side effect to print to screen does not return
  (display x) (display " + ") (display y) (newline)
  (display "= ") (+ x y))
(sum 3 4)

;what is expected?
;expect 2*4 print out 8 it will do the work but only the last expression will return
(define (newSum q z)
  (+ q z)
  (- q z)
  (- q q)
  (* 2 q))
(newSum 4 5)

(define a 4)
(define b (+ 3 4))
b ;will give 7 since it not a function/procedure it is only BOUNDED to that expression
(define (b) (+ 3 4)) ;func without parameters
b ;just b procedure b
(b) ;to invoke it have to put brackets to get the 7

;EVAL ORDER
(+ 3 (- 2 3))
; First thing -> eval the + sign <procedure>
;eval -> 3 -> just return 3
;eval (- 2 3) -> not literal have to go inside
   ;eval - sign <procedure>
   ;eval 2 -> return 2
   ;eval 3 -> return 3
  ;apply <procedure> - to 2 and 3 -> -1
;now returns (- 2 3) -> -1
;apply <procedure> + to 3 and -1 -> 2

;(define (square x)(* x x))
;(define (sum-of-squares x y)(+ (square x) (square y)))
;(define (f a)(sum-of-squares (+ a 1)(* a 2)))
;Every single line will be 136 just rewritten
;APPLICATIVE ORDER - this is the substituion model to do on A1
;(f 5)
;sum-of-squares (+ 5 1)(* 5 2)
;sum-of-squares (6 10)
; (+ (square 6) (square 10))
;(+ (* 6 6)) (* 10 10)
; (+ 36 100)
; 136

(and #f BadVar)
;(define (square x)(* x x))
;(define (sum-of-squares x y)(+ (square x) (square y)))
;(define (f a)(sum-of-squares (+ a 1)(* a 2)))
;Every single line will be 136 just rewritten
;NORMAL ORDER - this is the substituion model to do on A1
;(f 5)
;(sum-of-squares (+ 5 1) (* 5 2))
;(+ (square (+ 5 1)) (square (* 5 2)))
;(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))
;(+ (* 6 6) (* 10 10))
;(+ 36 100)
;136

(define x 3)
(define y 5)
(if (> x y) (- x y) (- y x))
; if (> 3 5) (- 3 5) (- 5 3)) done substituion
;first eval (> x y) so the (> 3 5) since 3 !> 5 gives if #f -> eval (- 5 3) -> 2

;in scheme only time false is false is in #f, can't use 0 for it
(if #f 3 4) ;return 4
(if 0 3 4) ; return 3 ANYTHING other then #f is considered #t
(if -435435 3 4) ;still a 3

;the ? indicates that it will be a predicate
(define (even? x)
  (if (= (modulo x 2) 0) #t #f)) ;have to use procedure modulo instead of %

(even? 3)
(even? 4)


