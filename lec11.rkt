;second part of lec 10 notes(when study cover closures)
;Pairs - (improper list) cons

(cons 1 2)
;get back (1 . 2) dot -> means a pair

(define x (cons 1 2))
x; same thing as above

;get first val of x - car
(car x) ;gives 1

;get second val of x - cdr
(cdr x) ;gives 2

(define y (cons 3 4))

;pair of pairs
(define z (cons x y))
z ;((1. 2) 3 . 4)
(car z) ; gives x pair
(cdr z) ; gives y pair

(pair? z);asks if this is a pair predicate #t
(pair? 5);#f

(caar z); equivalent car^2 on z -> 1
(cddr z); equivlaent to cdr^2 on z -> 4
;can mix and match them for example get the 1st value of the 2nd pair is cadr
(cadr z) ;->3 order goes from inside to outside first (cdr z) then wrap that in (car val)
;so ad on z

(define h (cons (cons 1 (cons 2 3)) 4))

;how to get 2?
(cadar h) ;-> 2 working backwards from right to left a (1), d (2) , a (1)

(define ex1 (cons 1 (cons 2 (cons 3 4))))
;get 4
(cdddr ex1)

;data abstraction example - rational numbers
;numbers expressed as fractions n/d where d!=0
;arithmetic operators and interface design


;addition (n1 * n2) + (n2 * d1)/(d1 * d2)
;subtraction (n1 * n2) - (n2 * d1)/(d1 * d2)
;mult (n1 * n2)/(d1 * d2)
;divide (n1 * d2)/(n2 * d1)

;interface design
;constructor make-rational num denom)
;selectors (numerator x) and (denominator x)

(define (make-rational num denom)
  (cons num denom))

(define (numerator x)
  (car x))

(define (denominator x)
  (cdr x))

;in scheme symbols are not case sensistive - for quiz

(define (add-rational r1 r2)
  ( / (+ (* (numerator r1) (denominator r2))
     (* (numerator r2) (denominator r1)))
      (* (denominator r1) (denominator r2))))

(define oneThird (make-rational 1 3))

(define twoThird (make-rational 2 3))

(add-rational onethird twothird) ; gives 1

;subtraction is simmilar just symbol - instea of +
;quiz question how to make a function common by just passing procedures to rational numbers
(define (del-rational r1 r2)
  ( / (- (* (numerator r1) (denominator r2))
     (* (numerator r2) (denominator r1)))
      (* (denominator r1) (denominator r2))))

(del-rational onethird twothird) ;-1/3

;how to display this
(define (print-rational r)
  (display (numerator r))
  (display "/")
  (display (denominator r))
  (newline))

(print-rational onethird)






