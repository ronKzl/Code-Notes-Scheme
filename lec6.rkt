(define (op x)
    (define (reduce num) (/ num 10))
    (if (or (= x 0)(and (> (abs x) 1) (< (abs x) 10)))x -1)



  )

(op 100)

;lecture 6 recursion
;top down recursion LINEAR 
(define (factorial x)
  (if (= x 1)
    1
    (* x (factorial (- x 1)))))

(factorial 5)

;recursive addition add 1 at each level of going down
(define (sum l r)
  (if (= r 0)
      l
      ( + 1 (sum l (- r 1)))))
(sum 5 2)

;bottom up recursive sum
;my way
(define (sum-iter l r)
  (define (s-iter acc count)
    (if (= acc r)
        count
        (s-iter (+ 1 acc) (+ 1 count))))

   (s-iter 0 l)
  )
(sum-iter 5 2)

;slides
#|
(define (sum-iteration op1 op2)
(define (sum-iter op1 op2)
(if (= op2 0)
op1
(sum-iter (+ op1 1) (- op2 1))))
(sum-iter op1 op2))
|#


;bottom-up recursion ITERATIVE
(define (f-iter n)
  ;helper function
  (define (fact-iter acc counter)
    (if (> counter n) ;goes from 1 to n inclusive
        acc
        (fact-iter (* acc counter) (+ 1 counter))) ;acc * curr counter and increment counter by 1
    )
  (fact-iter 1 1)) ;start from the base case of the bottom and build up
(f-iter 5)

;substituion model is different now
#|
(factorial-iter 5)
;(fact-iter 1 1) ; counter acc
;(fact-iter 2 1)
;(fact-iter 3 2)
;(fact-iter 4 6)
;(fact-iter 5 24)
;(fact-iter 6 120)
;120
|#

