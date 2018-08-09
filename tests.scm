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

(define (integers-step n step)
  (cons-stream n
               (integers-step (+ n step) step)))

(define primes (sieve (integers-starting-from 2)))



(define fib*
  (let loop ((a 0)
             (b 1))
    (cons-stream b
                 (loop b (+ a b)))))

(define (merge a b)
  (cond
   ((= (length a) 0) 
    b)
   ((= (length b) 0)
    a)
   (else
    (if (<= (car a) (car b))
        (cons (car a) (merge (cdr a) b))
        (cons (car b) (merge a (cdr b)))))))

;; i THINK this is tail recursive!
(define (merge' a b)
  (let loop ((a a)
             (b b)
             (result '()))
    (cond
     ((and (null? a) (null? b))
      (reverse result))
     ((null? a) 
      (loop a (cdr b)
            (cons (car b) result)))
     ((null? b)
      (loop (cdr a) b
            (cons (car a) result)))
     (else
      (if (<= (car a) (car b))
          (loop (cdr a) b 
                (cons (car a) result))
          (loop a (cdr b)
                (cons (car b) result)))))))


(define (split list)
  (let* ((n (quotient (length list) 2))
         (start (list-head list n))
         (end (list-tail list n)))
    (values start end)))

(define (mergesort lst)
  (cond 
   ((= (length lst) 1) lst)
   (else 
    (receive (start end) (split lst)
      (merge' (mergesort start) (mergesort end))))))
