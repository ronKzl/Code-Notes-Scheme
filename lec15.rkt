;scaling a tree - mult every number in a tree by a factor - same as lec 14 notes.
(define t (list (list 1 2 3) 4 (list 5 6 (list 7))))
t

(define (tree-map f T)
  (cond ((null? T) '())
        ((list? (car T)) ;if element is a list make a pair, recurse on car and cdr
                (cons
                 (tree-map f (car T))
                (tree-map f (cdr T))))
        (else (cons ;if element is a primitive apply the function to it and continue recursing on cdr
               (f (car T))
               (tree-map f (cdr T))))))
(tree-map (lambda (x) (* x x)) t)
(tree-map (lambda (x) (+ 2 x)) t)

;macro & streams

#|(define (foo x y)
(if (= x 0) x y))
(foo (* 3 0) (/ 3 0))|# ;Applicative eval fails cuz division by 0, normal succeeds and gives 0.
                                                               ; cuz first apply procedure eval when needed.

;A thunk is a function of zero arguments that “wraps” code to delay evaluation until the thunk is called.
;● Lambdas to the rescue – use a lambda that does not pass parameters.
;● Wrap the problematic subexpression in a thunk
(define (foo x y)
(if (= x 0) x (y))) ;put brackers here to eval y since passing lambda
(foo (* 3 0) (lambda () (/ 3 0)))

;funcs alone are not enough
(define (delay exp)
  (lambda () (exp)))

(define (force thunk) (thunk))

(define (foo x y)
  (if (= x 0)
      x
      (force y)))
;(foo (* 3 0) (delay (/ 3 0))) ;still crashes because of division by 0 cuz eager tries to eval 1st.

;special forms and macros
;Macros let use create
;define-syntax <keyword> and syntax-rules <other keyword> keywords
;then have a ((<pattern-1>) <template-1>) and so on for n-times.

;doing delay
(define-syntax delay
  (syntax-rules ()
    ((delay exp) ; _ idc
     (lambda () exp))))

(define-syntax force
  (syntax-rules ()
    ((force exp)
     (exp))))
;now this will work and will not give error, will look and see delay and replace it with the body
(foo (* 3 0) (delay (/ 3 0)))

;(foo (* 3 1) (delay (/ 3 0))) will still give error cuz force will execute the lambda

;doing my-if macro
(define-syntax my-if
  (syntax-rules ()
    ((my-if pred then-clause else-clause) ;pattern
     (if pred then-clause else-clause)))) ;what is done

(my-if (= 1 0) 1 2)

;lecture 16 - streams continued
;lazy streams in scheme (list with infinite values in it)


