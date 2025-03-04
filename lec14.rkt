
;making map
(define (map f L)
  (if (null? L)
      '()
      (cons (f (car L)) (map f (cdr L)))))

(map (lambda (x) (* x x)) '(1 2 3 4 5))

;filter - selecting elements from a list based on a
;condition (defined using a predicate function returns #t or #f)

#|
(define (filter predicate sequence)
`   (cond ((null? sequence) '())
     ((predicate (car sequence))
     (cons (car sequence) (filter predicate (cdr sequence)))) ; Add to list
     (else (filter predicate (cdr sequence))))); continue but don’t add to list
|#

(define (filter f L)
  (if (null? L)
      '()
      (if (f (car L))
          (cons (car L) (filter f (cdr L)));if true add to list
          (filter f (cdr L))))) ;else dont add keep loop

(filter even? '(1 2 3 4))

;predicate does not have to have a ? but its just a good form
(define (isEven? n)
  (= (modulo n 2) 0)) ;no need for t/f this equal sign will return the true and false.

(filter isEven? '(1 2 3 4 5 6))


;return all numbers divisible by 5 and exclude 10

(define (p? n)
  (if (= n 10) #f (= (modulo n 5) 0)))
; or (and (= (modulo n 5) 0) (not (= n 10)))
(filter p? '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))


;reducing list (accumulation) - take list and a binary operator and repeatedtly apply
;operator to combine elements of the list into a single result

;recursively
#|
(define (reduce op initial list)
   (if (null? list)
       initial
     (op (car list) (reduce op initial (cdr list)))
                  ))
|#

;iteratively
(define (reduce op acc L)
  (if (null? L)
      acc
      (reduce op (op acc (car L)) (cdr L))))

(reduce + 0 '(1 2 3))
(reduce * 1 '(1 2 3 4 5))

;end of lists


;start of trees (hierarchical structures list within a list)
;can combine with append - produces 1 flat list
;list - creates a new proper list whos elements are exactly arguments
;cons 2 lists together whose car cant itself be a list and cdr is another list.

;ex.
(define x '(1 2))
(define y '(3 4 5))

(append x y) ; (1 2 3 4 5)

(append (list 1 2 (list 3 4)) (list 5 6 7)) ; will give (1 2 (3 4) 5 6 7)
;just flattens everything on the 1st level

;has to end on a proper list
(list x y); => ((1 2) (3 4 5)) A list of two elements (each a sub-list)
;cons not inside a list just ends on whatever here will end in null cuz its in the proper list
;but if we did cons ( 1 2) 5) would be ((1 2) . 5)
(cons x y); => ((1 2) 3 4 5) A pair with x in the car, y in the cdr

(define b (list x y))
(define c (cons x y))

;draw (list (list 1 2 3) 4 (list 5 6 (list 7)))
;((1 2 3) 4 (5 6 (7)))
;3 top level box
;1 points to (1 2 3) then from these 3 boxes to point to 1/2/3
;other points to 4
;then last points to (5 6 (7)) then from here 3 boxes 1 points to 5/6 then the next is
;a level deeper to go to 7

(define t (list (list 1 2 3) 4 (list 5 6 (list 7))))
;want to get 7 how do we do it
;go backwards
;d
;d
;a
;d

;d
;a
;a
;then go walk from end point and assemble from the first a

(caadr (cdaddr t))
;ex find 1 and 4

;recursion on trees
;3 case recursion pattern:
;Base case: look for empty list
;Recursive case 1: if the car of the list is a list itself, recurse into that
;Recursive case 2: Ohterwise element is primitive (cons primitive call traverse on rest of list)

;DFS Tree Recursion
t
(define (traverse t)
  (cond
    ;base case
    ((null? t)
            (display ""));if empty print nothing
    ;element is itself a list traverse it as well
    ((list? (car t))
            (traverse (car t)) ;cur element
            (traverse (cdr t))) ;next element
    ;element is primitve display it and traverse the next one
    (else
            (display (car t))
            (display " ")
            (traverse (cdr t)))))
(traverse t)(newline)
;do we need a begin on the 2nd & 3rd cond statement?
;no cond already has the sequence of expressions built in!
;if does not have that and in an if-statement we will need the begin.

;scaling a tree
;multiply every number in a tree by factor
;if empty return a '()
;then same 2 recursive cases as above
;use cons to rebuild the original structure with updated values
(define (scale f t)
  (cond
    ;base case
    ((null? t)
            '());if empty print nothing
    ;element is itself a list traverse it as well
    ((list? (car t))
            (cons (scale f (car t)) ;cur element
            (scale f (cdr t)))) ;next element
    ;element is primitve display it and traverse the next one
    (else
            (cons (f (car t)) (scale f (cdr t))))))
(scale (lambda (x) (* x x)) t)
(traverse (scale (lambda (x) (* x x)) t))










      