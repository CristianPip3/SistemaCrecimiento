#lang racket

(require racket/gui/base)
(require db)

;;;;;;;;;;;;;;;;;;;;;CONEXIÓN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (conectar ) 
  (mysql-connect #:server "localhost"
                 #:port 3306
                 #:database "CRECIMIENTONI"
                 #:user "root"
                 #:password "IngePip3"))

(define (insertarMenor a b ) 
  (query (conectar)  "INSERT INTO user(id,name) VALUES (?,?)"a b)
)
(define (consultaId i)
  (query-rows (conectar)  "SELECT * FROM CONTROL WHERE id =?"i)
 )
(define (con i)
  (query-value  (conectar)  "SELECT id FROM CONTROL WHERE id =?"i)
 )
(define (recorridolista)
  (for/list ([n (in-query (conectar) "select idc from CONTROL where id =1")])
    n)
  

  )
(define(consultap i)
  (for/list ([n (in-query (conectar) "SELECT * FROM CONTROL WHERE id = ?"i)])
    n)
  (call-with-transaction (conectar)
    (lambda ()
      (for ([(n d)
             (in-query (conectar) "SELECT * FROM user " 
                       #:fetch 1)])
        (printf "~a: ~a\n" n d))))
  )
(define(co i)
 #| (for/list ([n (in-query (conectar) "SELECT * FROM CONTROL WHERE id = ?"i)])
    n)|#
  (call-with-transaction (conectar)
    (lambda ()
      (for ([(n d f g h)
             (in-query (conectar) "SELECT idc,id, fecha_c, pesoc, estaturac FROM CONTROL" 
                       #:fetch 2)])
        (printf "~a: ~a ~a ~a ~a\n" n d f g h)
        (printf "~a::\n" g))))
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(with-handlers ([(lambda (v) (equal? v 2))(lambda (v)'dos)])
(raise 2)
  )
(define (d)
  (printf "SOy nuevo"))

(with-handlers ([exn:fail:sql? (lambda (c) (d)) ]
                [string? (lambda (e) (printf "hola"))])
    (display "")
  
  (query (conectar)  "INSERT INTO user(id,name) VALUES (5, 'Marco')")
  
  
)