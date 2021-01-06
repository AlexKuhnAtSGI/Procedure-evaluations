;Alexander Kuhn
;ID 101023154
#lang racket

(define (reciprocal x)
  (if (= x 0) #f
      (/ 1 x)))

(define (f x)
  (if (= x -1) #f
  (+
   (* 3 x)
   (* 12 (reciprocal (+ x 1)
   )))))

(define (g x)
  (* x (reciprocal 4)))

;Applicative-order evaluation of (+(f (- (* 3 2) 1))(g (reciprocal (/ 1 12))))
;(+(f (- 6 1))(g (reciprocal (/ 1 12))))
;(+(f 5)(g (reciprocal (/ 1 12))))
;(+(f 5)(g (reciprocal 1/12)))
;(+ (f 5) (g (/ 1 1/12)))
;(+(f 5)(g 12))
;(+ (+ (* 3 5) (* 12 (reciprocal (+ 5 1)))) (g 12))
;(+ (+ 15 (* 12 (reciprocal (+ 5 1)))) (g 12))
;(+ (+ 15 (* 12 (reciprocal 6))) (g 12))
;(+ (+ 15 (* 12 (/ 1 6))) (g 12))
;(+ (+ 15 2) (g 12))
;(+ 17 (* 12 (reciprocal 4)))
;(+ 17 (* 12 (/ 1 4)))
;(+ 17 3)
;20

;Normal-order evaluation of (+(f (- (* 3 2) 1))(g (reciprocal (/ 1 12))))
;(+ (* 3 (- (* 3 2) 1)) (* 12 (reciprocal (+ (- (* 3 2) 1) 1)))(g (reciprocal (/ 1 12))))
;(+ (* 3 (- (* 3 2) 1)) (* 12 (reciprocal (+ (- (* 3 2) 1) 1)))(* (reciprocal (/ 1 12)) (reciprocal 4)))
;(+ (* 3 (- (* 3 2) 1)) (* 12 (/ 1 (+ (- (* 3 2) 1) 1)))(* (reciprocal (/ 1 12)) (reciprocal 4)))
;(+ (* 3 (- (* 3 2) 1)) (* 12 (/ 1 (+ (- (* 3 2) 1) 1)))(* (/ 1 (/ 1 12)) (reciprocal 4)))
;(+ (* 3 (- (* 3 2) 1)) (* 12 (/ 1 (+ (- (* 3 2) 1) 1)))(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ (* 3 (- 6 1)) (* 12 (/ 1 (+ (- (* 3 2) 1) 1)))(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ (* 3 5) (* 12 (/ 1 (+ (- (* 3 2) 1) 1)))(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ 15 (* 12 (/ 1 (+ (- (* 3 2) 1) 1)))(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ 15 (* 12 (/ 1 (+ (- 6 1) 1)))(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ 15 (* 12 (/ 1 (+ 5 1)))(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ 15 (* 12 (/ 1 6))(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ 15 (* 12 1/6)(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ 15 2(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ 17(* (/ 1 (/ 1 12)) (/ 1 4)))
;(+ 17(* (/ 1 1/12) (/ 1 4)))
;(+ 17(* 12 (/ 1 4)))
;(+ 17(* 12 1/4))
;(+ 17 3)
;20

;Testing Reciprocal (positive #, negative #, impossible 0 case)
(display "(reciprocal 2)=> ")(newline)
   (display "Expected: 1/2")(newline)
   (display "Actual: ")(reciprocal 2)(newline)

(display "(reciprocal -4)=> ")(newline)
   (display "Expected: -1/4")(newline)
   (display "Actual: ")(reciprocal 4)(newline)

(display "(reciprocal 0)=> ")(newline)
   (display "Expected: #f")(newline)
   (display "Actual: ")(reciprocal 0)(newline)

;Testing F (positive #, negative #, impossible -1 case)
(display "(f 2)=> ")(newline)
   (display "Expected: 10")(newline)
   (display "Actual: ")(f 2)(newline)

(display "(f -4)=> ")(newline)
   (display "Expected: -16")(newline)
   (display "Actual: ")(f -4)(newline)

(display "(f -1)=> ")(newline)
   (display "Expected: #f")(newline)
   (display "Actual: ")(f -1)(newline)

;Testing G (positive #, negative #, 0)
(display "(g 2)=> ")(newline)
   (display "Expected: 1/2")(newline)
   (display "Actual: ")(g 2)(newline)

(display "(g -4)=> ")(newline)
   (display "Expected: -1")(newline)
   (display "Actual: ")(g -4)(newline)

(display "(g 0)=> ")(newline)
   (display "Expected: 0")(newline)
   (display "Actual: ")(g 0)(newline)