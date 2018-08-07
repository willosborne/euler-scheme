(load "utils.scm")

;; exercise 3: largest prime factor
(define (ex3 num)
  (apply max (prime-factors num)))


(define (prime-factors n)
  (let loop1 ((n n)
             (divisor 2)
             (factors '()))
    (if (> n 1)
        (receive (n' factors') (let loop2 ((n n)
                                           (factors factors))
                                 (if (divisible? n divisor)
                                     (loop2 (/ n divisor)
                                            (cons divisor factors))
                                     (values n factors)))
           
          (loop1 n' (1+ divisor) factors'))
        factors)))
