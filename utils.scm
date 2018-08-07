(use-modules (ice-9 format))
(use-modules (ice-9 receive))
(import (rnrs))

(define-syntax cons-stream
  (syntax-rules ()
    ((cons-stream x y)
     (cons x (delay y)))))


(define head car)

(define (tail stream) (force (cdr stream)))

(define (stream-section n stream)
  (cond ((= n 0) '())
        (else
         (cons
          (head stream)
          (stream-section
           (- n 1)
           (tail stream))))))

(define (divisible? a b)
  (= (remainder a b) 0))

(define empty-stream? null?)

(define the-empty-stream '())

(define (filter-stream p lst)
  (cond ((empty-stream? lst) the-empty-stream)
        ((p (head lst)) 
         (cons-stream 
          (head lst) 
          (filter-stream p (tail lst))))
        (else
         (filter-stream p (tail lst)))))

(define take stream-section)
