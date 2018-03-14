#lang racket
(require racket/gui/base)
(define main-frame (new frame%
                        [label "main"]))

(define test (new list-box%
                  [label ""]
                  [choices (list "hello" "world")]
                  [columns '("key" "value")]
                  [parent main-frame]
                  [style (list 
                          'variable-columns
                          'single
                          'column-headers
                          'clickable-headers
                          'vertical-label)]))

(send main-frame show #t)
;It shows:
;key    value
;hello
;world
(send test get-string 1)
;Result:
;world

(send test set (list "1" "2" "3") (list "4" "5" "6"))
;It shows
;key value
;1   4
;2   5
;3   6
(send test get-string 1)
;Result
;2