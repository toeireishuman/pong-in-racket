# Pong in Racket
This is a project where I try to make a game of Pong using Racket. This is a self-imposed project after I finished Systematic Program Design Part 1 (also known as How To Code: Simple Data).


## Domain Analysis

### Constants

WINDOW
 - WINDOW-WIDTH
 - WINDOW-HEIGHT
 - WINDOW-COLOR

SHIELD-IMAGE
 - SHIELD-WIDTH
 - SHIELD-HEIGHT
 - SHIELD-COLOR

USER-SHIELD-XPOS

ENEMY-SHIELD-XPOS

BALL-IMAGE
 - BALL-RADIUS
 - BALL-COLOR


### Variables

USER
 - Natural[0, 11] (this is the player's score)
 - Natural[0, WINDOW-HEIGHT] (this is the vertical range of a user's shield)

ENEMY
 - Natural[0, 11] (this is the computer's score)
 - Natural[0, WINDOW-HEIGHT] (this is the vertical range of a computer's shield)

BALL
 - BALL-XPOS
 - BALL-YPOS


### big-bang Options

1. on-tick
2. to-draw
3. on-key


### Other characteristics

- I'm thinking of adding a game start and a game over screen, as well.