#lang racket
(define (lista1) '(13.4 1 17.2  2))
(define (lista2) '(16 15.5 9 8 7))
(define (generarPendiente x1 y1 x2 y2)
  (/(- y2 y1)(- x2 x1))
  )
(define (generarB x1 y1 m)
  (+(* m x1) y1 )
  )
(define (generarP x1 y1 x2 y2)
  (/(- y2 y1)(- x2 x1))
  (let ([m (lambda (x1 y1 x2 y2)
             (/(- y2 y1)(- x2 x1))) ]
        [b (generarPendiente x1 y1 x2 y2)])
    (  + (m x1 y1 x2 y2) b )))

(define (mostrar y b)
  (if(< y b)
     (printf " Verdadero ~a > ~a " y b)
     (printf " Falso ~a  ~a " y b)
     )
  
  )
(define (verificarI m x y )
   (+ (* m x ) y) 
 
  )
(define (generarP2 x1 y1 x2 y2 x d)
 
  (let* ([m (generarPendiente x1 y1 x2 y2)]
        [b (generarB x2 y2 m)]
        [y (verificarI m x d)]
        )
    ( mostrar y b)))


  

(define (generarD id g )
  (printf "prueba"))