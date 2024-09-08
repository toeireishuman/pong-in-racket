;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname pong) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; Pong

;; =================
;; Constant definitions:

(define WIDTH 1280)
(define HEIGHT 720)
(define COLOR "Midnight Blue")
(define MTS (empty-scene WIDTH HEIGHT COLOR))

(define SHIELD-WIDTH 16)
(define SHIELD-HEIGHT 96)
(define SHIELD-COLOR "White")
(define SHIELD-IMAGE (rectangle SHIELD-WIDTH SHIELD-HEIGHT "solid" SHIELD-COLOR))

(define USER-XPOS 20)
(define ENEMY-XPOS (- WIDTH 20))
(define YPOS-S (/ HEIGHT 2))

(define BALL-RADIUS 16)
(define BALL-COLOR "White")
(define BALL-IMAGE (circle BALL-RADIUS "solid" BALL-COLOR))
(define BALL-X-S (/ WIDTH 2))
(define BALL-Y-S (/ HEIGHT 2))
(define BALL-DX-S 4)
(define BALL-DY-S 4)


;; =================
;; Data definitions:

(define-struct player (score xpos ypos))
;; Player is (make-player Natural[0, 11] Natural[0, WIDTH] Natural[0, HEIGHT])
;; interp. (make-player score ypos) is a player, where
;;           - score is the player's score,
;;           - xpos is the player's current x-position, and
;;           - ypos is the player's current y-position.
(define P1 (make-player 0 USER-XPOS YPOS-S))
(define P2 (make-player 5 ENEMY-XPOS 759))
(define P3 (make-player 11 ENEMY-XPOS 45))

#;
(define (fn-for-player p)
  (... (player-score p)
       (player-xpos p)
       (player-ypos p)))

;; Template rules used:
;;  - compound: 3 fields


(define-struct ball (x y dx dy))
;; Ball is (make-ball Natural[0, WIDTH] Natural[0, HEIGHT] Natural Natural)
;; interp. (make-ball x y dx dy) is a ball, with
;;           - x is the ball's current x-position,
;;           - y is the ball's current y-position,
;;           - dx is the ball's x-velocity, and
;;           - dy is the ball's y-velocity.

#;
(define (fn-for-ball b)
  (... (ball-x b)
       (ball-y b)
       (ball-dx b)
       (ball-dy b)))

;; Template rules used:
;;  - compound: 4 fields


(define-struct pong (user enemy ball))
;; Pong is (make-pong Player Player Ball)
;; interp. (make-pong user enemy ball) is a game of pong, where
;;           - user is a Player serving as the game's playable character,
;;           - enemy is a Player serving as the computer opponent, and
;;           - ball is a Ball, serving as the ball in Pong.
(define PONG1 (make-pong (make-player 0 USER-XPOS YPOS-S)
                         (make-player 0 ENEMY-XPOS YPOS-S)
                         (make-ball BALL-X-S BALL-Y-S BALL-DX-S BALL-DY-S)))

#;
(define (fn-for-pong g)
  (... (pong-user g)
       (pong-enemy g)
       (pong-ball g)))

;; Template rules used:
;;  - compound: 3 fields



;; =================
;; Functions:

;; Pong -> Pong
;; start the world with ...
;; 
(define (main g)
  (big-bang g                   ; Pong
    (on-tick   next-pong)       ; Pong -> Pong
    (to-draw   render-pong)     ; Pong -> Image
    (stop-when stop-pong)       ; Pong -> Boolean
    (on-key    handle-key)))    ; Pong KeyEvent -> Pong

;; Pong -> Pong
;; takes care of all the game elements per tick
;; !!!
(define (next-pong g) ...)


;; Pong -> Image
;; renders all the necessary game elements on the screen
;; !!!
(define (render-pong g) ...)


;; Pong -> Boolean
;; stops the game once either player scores 11 points
;; !!!
(define (stop-pong g) ...)


;; Pong KeyEvent -> Pong
;; handles all the input from the user
;; !!!
(define (handle-key ke g) ...)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Constant definitions:

(define TEXT-COLOR "White")
(define TEXT-MAIN-SIZE 100)
(define TEXT-SUB-SIZE 32)

(define WIN-SCREEN (place-image (above (text "You won!!!" TEXT-MAIN-SIZE TEXT-COLOR)
                                       (text "Game over" TEXT-SUB-SIZE TEXT-COLOR))
                                (/ WIDTH 2)
                                (/ HEIGHT 2)
                                MTS))
(define LOSE-SCREEN (place-image (above (text "You lost." TEXT-MAIN-SIZE TEXT-COLOR)
                                        (text "Game over" TEXT-SUB-SIZE TEXT-COLOR))
                                 (/ WIDTH 2)
                                 (/ HEIGHT 2)
                                 MTS))

;; Function definitions:

;; Pong -> Image
;; show a game over screen when one the players wins
(check-expect (game-over (make-pong (make-player 0 USER-XPOS YPOS-S)
                                    (make-player 0 ENEMY-XPOS YPOS-S)
                                    (make-ball BALL-X-S BALL-Y-S BALL-DX-S BALL-DY-S)))
              empty-image)
(check-expect (game-over (make-pong (make-player 11 USER-XPOS YPOS-S)
                                    (make-player 0 ENEMY-XPOS YPOS-S)
                                    (make-ball BALL-X-S BALL-Y-S BALL-DX-S BALL-DY-S)))
              WIN-SCREEN)
(check-expect (game-over (make-pong (make-player 0 USER-XPOS YPOS-S)
                                    (make-player 11 ENEMY-XPOS YPOS-S)
                                    (make-ball BALL-X-S BALL-Y-S BALL-DX-S BALL-DY-S)))
              LOSE-SCREEN)

;(define (game-over p) empty-image)

(define (game-over g)
  (cond [(= (player-score (pong-user g)) 11)
         WIN-SCREEN]
        [(= (player-score (pong-enemy g)) 11)
         LOSE-SCREEN]
        [else
         empty-image]))