(load "utils.scm")

;; exercise 2: the sum of all even fibonacci numbers below n
(define (ex2 top)
  (let loop ((a 0)
             (b 1)
             (acc 0))
    (if (<= b top)
        (loop b (+ a b) (if (divisible? b 2)
                            (begin
                              (+ acc b))
                            acc))
        acc)))
