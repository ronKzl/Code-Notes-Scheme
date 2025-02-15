;lists

;under hood pair elements with the first one being value and second one being an -> to next one or null at the end.
(list 1 2 3 4)
'(1 2 3 4)
;under the hood syntactic sugar for pairs with last pair element having an empty null
(cons 1 (cons 2 (cons 3 (cons 4 '()))))
;substituion model (cons 4 '()) is just returns 4 and so on
(cons 1 (cons 2 (cons 3 '(4))))
(cons 1 (cons 2 '(3 4)))
(cons 1 '(2 3 4))
'(1 2 3 4)
(cons 1 '());just gives 1 called a proper list

; '() nil represents the empty list

(list) ;gives ()
(list 1 2 3 4 '()) ;explicit ask for empty list to show up 1 2 3 4 ()

(list 1 2 3 4 '(1 2 3 4)) ;list with another list inside the 5th slot


;improper list means there is a dot at the end and the '() at the end is missing


;access list
;car points to the 1st element
;cdr points to the rest of the list
;if want to get 2
(define arr (list 1 2 3 "p"))
arr
;1st val
(car arr)
;rest of the list
(cdr arr)

;to get 2, need to first refrence rest of list with cdr and then do a car
(car (cdr arr))
;for p do d 3 times until we have just the p and then do an a - val derefrence
(cadddr arr)

;TO DO composite CADDDDR CANT BE MORE THEN 4 WILL GET UNDEFINED MAX IS 4 OTHERWISE HAVE TO USE THE CAR AND CDR

; = eq? - compare objects themselves to see whether they are the same object
; = eqv? - same thing as eq but will allow proper thing on decimal
; = equal? - comapres the actual value not the location

(define x (list 1 2 3 4))
(define y '(1 2 3 4))
(define q (cons 1 (cons 2 (cons 3 (cons 4 '())))))
(define z x)

;all look the same but are they equivlanet?
x
y
q
z
(display "eq? eqv? = ?equal \n")
(eq? x y) ;in memory are they equal? -> not the same locations (x and y are 2 different symbols) gives #f
(eq? y q);#f
(eq? z x); #t because z is bound to x and its the same spot in memory

(eq? 0.3 0.3) ;also works on small ints #t
(eq? (+ 1 2) (+ 1 2)) ;also gives true on regualr int expressions #t
(eq? (+ 0.1 0.2) (+ 0.1 0.2)) ;but when do on real numbers expression NOT TRUE GIVES #f

(eqv? (+ 0.1 0.2) (+ 0.1 0.2)) ;works #t

(equal? x y)  ;t since acutally compares the 2 lists the values inside of them

; '() null special always points to the same location in memory


(list? '(1 2 3 4)) ;t

(null? '(1 2 3 4)) ;f
(null? '()) ;t empty list is null

;operations
;range function recursive and iterative + get Ith element from a list

;recursive base case if a > b return '()
;recursive case generate a list from a to b
;cons the current a onto the result
;cons to the front proper
;cons to the back improper does ((123) . 5)
(define (recursive-list a b)
  (if (> a b)
      '()
      ;build the list of cons
      (cons a (recursive-list (+ a 1) b))))
(recursive-list 1 4)
;cons 1 (recursive-list 2 4))
;(cons 1 ( 2 (recursive-list 3 4)))
;(cons 1 ( 2 ( 3 (recursive-list 4 4))))
;(cons 1 ( 2 ( 3 ( 4 (recursive-list 5 4)))))
;base case met
;(cons 1 ( 2 ( 3 ( 4 '()))))
;done this is what gets returned will get collapsed inbto (1 2 3 4)

;look at notes
;iterative


;get the I-th element value


