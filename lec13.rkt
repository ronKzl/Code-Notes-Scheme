;lists (1 2 3 4) - empty list '() PROPER LISTS
(cons 1 (cons 2 (cons 3 (cons 4 '()))))
'(1 2 3 4)
(list 1 2 3 4)
;improper list
(cons 2 3)

'('())
;prints a list that has an empty list inside of it ('())
;so the empty list is actually an element
(define a '('()))

(null? a) ;gives #f it has an empty list inside of it
(car a) ; gives the '() empty list element
(cdr a); gives the () empty list final one

;(4) 4 ()
;when we have a proper list cons anything to front it will just append to the front and keep proper list
;but if we append to the back of it just a literal (not the empty list) it will create a pair with the .
;and it becomes improper

;range function - recursive process (cant modify a value at index i because of referential transperency)
; iterative process use a helper function that accumulates the result in a paramter

(define (range a b)
  ;start from the back of the list and move to front to do proper
  (define (iter-build arr i)
    (if (< i a) ;while index is not less then a still have to add
        arr
        (iter-build (cons i arr) (- i 1)))) ;cons i and rest of array at the front and decrement
  (iter-build '() b)) ; start by giving the empty list and give the high range
(range 1 5)

;find the ith element in the list
;technique known as cdring down
;base case i = 0 return car list
;recursive case: decrement i and take cdr list

(define (get-element i L)
  (if (= i 0) ;to make it not the index but the actual element just change i to 1
      (car L)
      (get-element (- i 1) (cdr L))))

(get-element 2 '(5 6 7 8 9 10))

;sub
;(get-element 2 '(5 6 7 8 9 10))
;(get-element 1 '(6 7 8 9 10))
;(get-element 0 '( 7 8 9 10))
;base case hit do car '(7 8 9 10)
;gets 7 found at index 2

;find the length of the list using recursive approach
(define (length-list L)
  (if (null? L)
      0
      (+ 1 (length-list (cdr L)))))
(length-list '(1 2 3 4 ))

;iterative process
(define (length-l L)
  (define (iter L res)
    (if (null? L)
        res
        (iter (cdr L) (+ 1 res))))
  (iter L 0))
(length-list '(1 2 3 4 ))

;joining 2 lists
;recursively defer cons of each element from the first list onto the second. CONSING UP.
;DO NOT JUST APPEND 1 LIST TO THE OTHER

;just destructure L1 as soon as its empty just append L2 to it since its proper list its cool.
(define (append L1 L2)
  (if (null? L1)
      L2
      (cons (car L1) (append (cdr L1) L2))))
(append '(1 2 3 4) '(5 6 7))

;sub
;(append '(1 2) '(5 6 7))
;cons 1 (append '(2) '(5 6 7))
;cons 1 (cons 2 (append '() '(5 6 7))
;now null do not append the '() append the 2nd proper list
;(cons 1 (cons 2 '(5 6 7)))
;(cons 1 '(2 5 6 7))
;(1 2 5 6 7)

;mapping over lists
;how to scale numbers in a list
;(scale-list (list 1 2 3 4 5) 10); => (10 20 30 40 50)

(define (scale-list L num)
  (if (null? L)
      '()
      (cons (* num (car L)) (scale-list (cdr L) num))))
(scale-list (list 1 2 3 4 5) 10)

;next step just pass in the function and apply that to the element instead of just multiply


