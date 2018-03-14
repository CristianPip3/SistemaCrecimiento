#lang racket
(require racket/gui/base)

(define frame (new frame%
                   [label "Example"]
                   [width 300]
                   [height 300]))
(new canvas% [parent frame]
             [paint-callback
              (lambda (canvas dc)
                (send dc set-scale 3 3)
                (send dc set-text-foreground "red")
                (send dc draw-text "Don't Panic!" 5 5))])
(send frame show #t)