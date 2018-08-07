(load "utils.scm")

(define (multiple-3-or-5? num)
  (or (= (modulo num 3) 0)
      (= (modulo num 5) 0)))

;; ex1: sum of all multiples of 3 or 5 below n
(define (ex1 top)
  (let loop ((i 0)
             (acc 0))
    (let* ((x (if (multiple-3-or-5? i)
                  (+ i acc)
                  acc)))
      
      (if (< i (- top 1))
          (loop (+ i 1) x)
          x ))))
