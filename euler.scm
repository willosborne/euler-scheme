
(load "utils.scm")
(load "tests.scm")



;; this file is sorta a scratchpad 



;; this is a test
(define (nested-loop n)
  (let loop1 ((i 0))
    (let loop2 ((j 0))
        (format #t "i: ~d, j: ~d~%" i j)
        (when (< j n)
          (loop2 (+ 1 j))))
    
    (when (< i n)
      (loop1 (+ 1 i)))))


