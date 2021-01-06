;Alexander Kuhn
;ID 101023154
#lang racket

(define (quadratic a b c)
  (if (= a 0) #f
  (if (< (- (expt b 2) (* 4 a c)) 0) #f
      (/
       (+ (* b -1) (sqrt (- (expt b 2) (* 4 a c))))
       (* 2 a)
       ))))

;Testing Quadratic (simple cases)
(display "(quadratic 4 8 2)=> ")(newline)
   (display "Expected: -0.292893218813")(newline)
   (display "Actual: ")(quadratic 4 8 2)(newline)

(display "(quadratic 2 5 3)=> ")(newline)
   (display "Expected: -1")(newline)
   (display "Actual: ")(quadratic 2 5 3)(newline)

;large numbers
(display "(quadratic 200 700 300)=> ")(newline)
   (display "Expected: -1/2")(newline)
   (display "Actual: ")(quadratic 200 700 300)(newline)

;outside cases (a = 0, b^2 - 4ac < 0)
(display "(quadratic 0 5 3)=> ")(newline)
   (display "Expected: #f")(newline)
   (display "Actual: ")(quadratic 0 5 3)(newline)

(display "(quadratic 10 5 3)=> ")(newline)
   (display "Expected: #f")(newline)
   (display "Actual: ")(quadratic 10 5 3)(newline)