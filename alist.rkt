#lang racket

(provide alist-init alist-add alist-lookup)

(define alist-init 
  (lambda () '()))

(define alist-add
  (lambda (new old alist)
    (cons (cons new old) alist)))

(define alist-lookup
  (lambda (name alist)
    (if (null? alist)
      #f
      (let* [(item (car alist))
             (new (car item))
             (old (cdr item))]
        (if (eq? name old)
          new
          (alist-lookup name (cdr alist)))))))