;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pong) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)

;; Pong

;; =================
;; Constants:

(define WINDOW-WIDTH 720)
(define WINDOW-HEIGHT 1280)
(define WINDOW-COLOR "Midnight Blue")
(define WINDOW (empty-scene WINDOW-WIDTH WINDOW-HEIGHT WINDOW-COLOR))

(define SHIELD-WIDTH 16)
(define SHIELD-HEIGHT 96)
(define SHIELD-COLOR "White")
(define SHIELD-IMAGE (rectangle SHIELD-WIDTH SHIELD-HEIGHT "solid" SHIELD-COLOR))

(define USER-SHIELD-XPOS 20)
(define ENEMY-SHIELD-XPOS (- WINDOW-WIDTH 20))

(define BALL-RADIUS 16)
(define BALL-COLOR "White")
(define BALL-IMAGE (circle BALL-RADIUS "solid" BALL-COLOR))


;; =================
;; Data definitions:

;; WS is ... (give WS a better name)



;; =================
;; Functions:

;; WS -> WS
;; start the world with ...
;; 
(define (main ws)
  (big-bang ws                   ; WS
            (on-tick   tock)     ; WS -> WS
            (to-draw   render)   ; WS -> Image
            (stop-when ...)      ; WS -> Boolean
            (on-mouse  ...)      ; WS Integer Integer MouseEvent -> WS
            (on-key    ...)))    ; WS KeyEvent -> WS

;; WS -> WS
;; produce the next ...
;; !!!
(define (tock ws) ...)


;; WS -> Image
;; render ... 
;; !!!
(define (render ws) ...)