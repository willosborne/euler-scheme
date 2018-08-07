(load "utils.scm")

;; exercise 3: largest prime factor
;; starting to get the hang of this! this solution is purely functional and uses no mutation; it's also tail-recursive for speed.
;; uses SRFI-8 for the receive function (this seems to be the closest scheme gets to #'multiple-value-bind from Common Lisp
;; the code to load srfi-8 is in utils.scm
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
