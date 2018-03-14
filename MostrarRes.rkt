#lang racket
(require racket/gui/base)
(require db)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define ve(new frame% [label "CrecimientoNI"] [width 200]
                   [height 200]))
(define list-box (new list-box%
                  [label ""]
                  [choices '() ]
                  [columns '("Id" "Fecha" "Diagnostico")]
                  [parent ve]
                  [style (list 
                          'variable-columns
                          'single
                          'column-headers
                          'clickable-headers
                          'vertical-label)]))
(define list-box1 (new list-box%
                      (label "")
                      (parent (new horizontal-panel%
                                   (parent ve)
                                   (style (list 'border))))
                      (choices (list "Item 0"
                                     "Item 1"                            
                                     "Item 2"))
                      (style (list 'multiple
                                   'column-headers))
                      (columns (list "id" "Diagnostico" "Fecha"))))



;;;;;;;;;;;;;;;;;;;;;CONEXIÓN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (conectar ) 
  (mysql-connect #:server "localhost"
                 #:port 3306
                 #:database "CRECIMIENTONI"
                 #:user "root"
                 #:password "IngePip3"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (conversion n)
  (if(string? n)
     n
     (number->string n)) 
)
(define (cc c)
   (list->string c))
(define (lista) '())
(define poninicio (lambda (L y)
                    (if (null? L)
                        (cons y L)
                        (cons (car L) (poninicio (cdr L) y))
                    )
                    ))

(define(co )
 #| (for/list ([n (in-query (conectar) "SELECT * FROM CONTROL WHERE id = ?"i)])
    n)|#
  (define li 
    (in-query (conectar) "SELECT diagnostico  FROM RESULTADOS" 
                       #:fetch 2))
  (call-with-transaction (conectar)
    (lambda ()
      (for/list ([(i )
             (in-query (conectar) "SELECT diagnostico   FROM RESULTADOS" 
                       #:fetch 1)])
        (printf "~a:\n" i )
        ;;(printf "~a::\n" i)
        (car (cons (conversion i) '()))
        
      ;;(cons (conversion i) '())
            
        ;;(send list-box append (conversion g))
        ;;(send list-box append  "hola"  )
        ;;(send test set (list "1" "2" "3") (list "4" "5" "6"))
       ;; (append (conversion n) lista )
        ;;(send list-box set (co 1) (list "1" "2" "3") (list "1" "2" "3"))
       
        )))
  
  
  )

(send list-box set (co ) (co )  (co ) )
(send ve show #t)