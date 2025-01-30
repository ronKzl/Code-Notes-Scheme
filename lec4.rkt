;(and #t newVar) give error since newVar undefine and only exists on 1st #f (and #f newVar) will work.

(define x 5)

(define (signum x)
(cond
((> x 0) 1)
((= x 0) 0)
((< x 0) -1)))

(define (signum x)
(cond
((> x 0) 1)
((= x 0) 0)
(else -1))) ;synatctic sugar for #t can do (#t - 1)

(signum -3)

(signum 1) ; how does it get evaluated?
;1st see cond and do (> 1 0) 1 (= 1 0) 0 (< 1 0) - 1
;first it will be (> 1 0) since that evals to true no need to go to equals

;works in this case does can do multiple things in 1 clause
(define (signum2 x)
(cond
((> x 0) (display "positive ") 1)
((= x 0) (display "zero ") 0)
((< x 0) (display "negative ") -1)))

(signum2 -1)


(define (ex x)
  (cond
    ((> x 10) (display "high")(newline))
    ((and (<= x 10) (>= x 5)) (display "medium")(newline))
    ((< x 5) (display "low")(newline))))


(define (ex x)
  (cond
    ((> x 10) (display "high")(newline))
    ((and (<= x 10) (>= x 5)) (display "medium")(newline))
    ((< x 5) (display "low")(newline))))

(ex 11)
(ex 8)
(ex 5)
(ex 4)


#|(define (ex x)
  (cond
    ((> x 10) (display "high")(newline))
    ((< x 5) (display "low")(newline))
    (else (display "medium")(newline))))
 |#

;above with cond but if you try to do the same thing in an if-statment it will not work!
;can't do this because there is no sequencing cond can do it because its built in
;in an if-statement have something called BEGIN to do that
; if (> x 0)(begin (display 'hh') 1) will work without the keyword it will not!
;begin <epxr1> <expr2> <expr3>

;page 30 HW



    