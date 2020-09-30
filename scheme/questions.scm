(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (helper s x count)
  (cond
    ((null? s) x)
    ((not (null? s)) (helper (cdr s) (append x (list (list count (car s)))) (+ count 1)))
    )
)
(helper s nil 0)

)

  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (define (helper comp list1 list2 new)
    (cond
      ((and (null? list1) (null? list2)) new)
      ((null? list1) (helper comp list1 (cdr list2) (append new (list (car list2)))))
      ((null? list2) (helper comp (cdr list1) list2 (append new (list (car list1)))))
      ((comp (car list1) (car list2)) (helper comp (cdr list1) list2 (append new (list (car list1)))))
      ((comp (car list2) (car list1)) (helper comp list1 (cdr list2) (append new (list (car list2)))))
      (else (helper comp list1 (cdr list2) (append new (car list2))))
      ))
  (helper comp list1 list2 nil)
  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    (define (helper s holder result prev)
      (cond
        ((and (null? (cdr s)) (<= prev (car s))) (append result (list (append holder (car s)))))
        ((and (null? (cdr s)) (> prev (car s))) (append result (list holder) (list (list (car s)))))
        ((null? s) result)
        ((<= prev (car s)) (helper (cdr s) (append holder (list (car s))) result (car s)))
        ((> prev (car s)) (helper (cdr s) (list (car s)) (append result (list holder)) (car s))))
  )
  (helper s nil nil 0)
  )
    ; END PROBLEM 17
