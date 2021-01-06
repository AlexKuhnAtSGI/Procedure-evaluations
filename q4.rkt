;Alexander Kuhn
;ID 101023154
#lang racket
(define (fib n)
  (-
   (* (/ 1 (sqrt 5)) (expt (/ (+ 1 (sqrt 5)) 2) n))
   (* (/ 1 (sqrt 5)) (expt (/ (- 1 (sqrt 5)) 2) n))))

(define (fibrec n)
    (cond  ((= n 0) 0)
           ((= n 1) 1)
           (else (+ (fibrec (- n 1))
                    (fibrec (- n 2))))))

(define (testfib n epsilon)
  (let ((a (fib n)) (b (fibrec n)))
    (values a b
            (if (> (- b a) epsilon)
                #f #t))))

;Testing testfib (base cases)
(display "(testfib 0 0)=> ")(newline)
   (display "Expected: 0 0 #t")(newline)
   (display "Actual: ")(testfib 0 0)(newline)

(display "(testfib 1 0)=> ")(newline)
   (display "Expected: 1 1 #t")(newline)
   (display "Actual: ")(testfib 1 0)(newline)

;Testing testfib (provided test cases)
(display "(testfib 40 0.000000001)=> ")(newline)
   (display "Expected: 102334154.99999999 102334155 #f")(newline)
   (display "Actual: ")(testfib 40 0.000000001)(newline)

(display "(testfib 15 0)=> ")(newline)
   (display "Expected: 610.0 610 #t")(newline)
   (display "Actual: ")(testfib 15 0)(newline)

(display "(testfib 20 0)=> ")(newline)
   (display "Expected: 6764.999999999999 6765 #f")(newline)
   (display "Actual: ")(testfib 20 0)(newline)
