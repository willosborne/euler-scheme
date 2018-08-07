(define-macro (backwards body)
  (reverse body))

(define ones (cons-stream 1 ones))

(define (sieve stream)
  (cons-stream
   (head stream)
   (sieve
    (filter-stream
     (lambda (x) (not (divisible? x (head stream))))
     (tail stream)))))

(define (integers-starting-from n)
  (cons-stream n
               (integers-starting-from (+ n 1))))

(define primes (sieve (integers-starting-from 2)))



(define fib*
  (let loop ((a 0)
             (b 1))
    (cons-stream b
                 (loop b (+ a b)))))
