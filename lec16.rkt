;special forms
; Delay - gives promise to eval later, Force - (procedure) evals experession, Goal - build lazy list (Stream)

(define x (delay (+ 1 1)))
x ;returns a #<promise>, what a promise is contains that expression in there.
(force x) ; gives the 2, i.e evals the promise

;streams as lazy list - its just a pair (cons) i.e improper list
;the car is 1st element that gets evaluated
;the cdr is a delayed computation (promise) of the rest of the stream
;we do not construct the entire list at once

(define y (cons 1 (delay (+ 1 1))))
y ; (1 . #<promise>)
(car y) ; 1
(cdr y) ; #promise
(force (cdr y)) ;expression is evaled get 2

;streams only compute each next element on demand

;naive approach (using regular cons + delay)
(define z (cons 1 (delay (cons 2 (delay (cons 40 '()))))))
z
;gives 1 . #promise where the promise has the rest of the elements

(car (force (cdr z)));to get 2, have to constatly do cdr force cdr force until get to where you want then you can do a car
(cdr (force (cdr (force (cdr z)))));gives null can't car this

;NOT OPTIMAL to do that ^^

;stream-cons special form use for A4
(define-syntax stream-cons
  (syntax-rules()
    ((stream-cons a b)
     (cons a (delay b)))))
(define h (stream-cons 5 3))
h
(car h) ;5
(force (cdr h)) ;3

;hint about syntactic abstraction
;because stream-cons is special form it did not eval (/ 3 0)

(define (stream-car stream)
  (car stream))
(stream-car h) ;5

(define (stream-cdr stream)
  (force (cdr stream)));evals the next promise of the stream (gets promise and forces that promise)
(stream-cdr h);3

(define s (stream-cons 1 (stream-cons 2 (stream-cons 3 '()))))
(stream-car s);1
(stream-cdr s); (2. #Promise)

;stream-range
(define (stream-range a b)
  (if (> a b)
      '()
      (stream-cons a (stream-range (+ a 1) b)))) ;make a stream between the first number and the promise function that will exectue the next value

(define a (stream-range 5 10));(5. #promise)
;(substituion model (stream-range 1 10)
;(stream-cons 1 (stream-range (+ 1 1) 10)) (cons a (delay (stream-range 2 10))


;stream n-th element
(define (stream-ref n stream)
  (cond ((= n 0) ;if wanted the actual element and not the index just change here to 1
         (stream-car stream))
        (else
         (stream-ref (- n 1) (stream-cdr stream)))))

(stream-ref 2 (stream-range 5 10));7 since 5 to 10: 0 1 2

;filter on stream
(define (stream-filter pred stream)
  (cond ((null? stream) '());base case
        ((pred (stream-car stream));recursive case if true
         (stream-cons (stream-car stream);make a stream of that val that matches and the rest back of the stream
                      (stream-filter pred (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream))))) ;dont include the element in the new stream just go to the next

(stream-filter even? (stream-range 7 10));returns 8 and a promise

;so now compute the 2nd even between 10000 and 10000000

(stream-car ;derefrence it giving 10002
 (stream-cdr ;take the 2nd element from stream
  (stream-filter even? (stream-range 10000 1000000)))) ;filter the given stream on if the element is even
;(10000 promise)
;take the promise -> (10002 . promise) ;2nd element is need do stream-car and get it.

;infinte streams
(define (integers-starting-from n)
  ;no base case so runs infinetly but stops when hit a promise
  (stream-cons n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))
(stream-car integers)
(stream-car (stream-cdr integers))

(stream-ref 2 integers);gives 3 since stream-ref is index based
(stream-ref 10 integers);11

(define seven (stream-filter (lambda (x) (= 0 (modulo x 7))) integers))
(stream-ref 3 seven);28 i.e the 4th val devidable by 7
(stream-ref 0 seven)

;infinite stream of squares
(define (squares-starting-from n)
  (stream-cons (* n n) (squares-starting-from (+ n 1))))
(define squares (squares-starting-from 1))
(stream-ref 3 squares) ;16


