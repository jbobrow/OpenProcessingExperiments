
/*****************************************
 * Assignment <<< 3 >>
 * Name:         <<< Riley Cutchin >>>
 * Course:       CSC 103 - Creative Computing - Fall 2014
 * Submitted:    <<< 17 September 2014 >>>
 * 
 * <<< A small sketch of a game of Pong. >>>
 *
***********************************************/

// Variables used to define the ball
float xDistance = 0;
float xHeight = 0;
float x = 0;
float x2 = 0;

//Variables used to define the paddles
float p1Height = 1;
float p2Height = 1;

// The rate of travel of the ball
float xSpeed = 1;
boolean xAccelerate = false;
void setup(){
  size(501, 251);
  frameRate(60);
}

void draw(){
  background(255, 255, 255);
  /* This defines the fuction bounce() so that it will
  execute on the screen */
  bounce();
  /* This defines the functions in order to move the paddles */
  p1Move();
  p2Move();
  
  //Defines the shapes used on screen
  strokeWeight(3);
  
  // This is the outline or the "playing field"
  fill(0, 0, 0);
  rect(0, 0, 500, 250, 10);
  
  // These are the two paddles
  fill(150, 150, 150);
  rect(10, p1Height, 15, 75, 10); // Left Paddle
  rect(475, p2Height, 15, 75, 10); // Right Paddle
  
  /* This is the ball, I used a rectangle to be able to 
  have more control of the bounce */
  fill(255, 255, 0);
  rect(xDistance, xHeight, 20, 20, 20);
  
  /* This is the "net" */
  strokeWeight(6);
  stroke(0, 255, 255, 150);
  line(251, 0, 251, 250);
}
/* This function is used to control the paddle movements */
void p1Move(){
  // This is for the left paddle
  if ( xHeight < 250 ){
    p1Height = xHeight - 20;
  } /* else if ( xHeight < 250 ){
    p1Height =  + 2;
  } */
  if (p1Height < 0) {
    p1Height = 0;
  }
  if (p1Height > 175){
    p1Height = 175;
  }
}
void p2Move(){
  // This is for the right paddle
  if ( xHeight < 250 ){
    p2Height = xHeight - 20;
  } /* else if( keyCode == DOWN ){
    p2Height = p2Height + 2;
  } */
  if (p2Height < 0) {
    p2Height = 0;
  }
  if (p2Height > 175) {
   p2Height = 175;
  }
}
/* I decided to use functions to define the bounce 
because the paddles would have needed more configuration 
had I not */
void bounce(){
 if(x < 455){
    lBounce();
    xSpeed = xSpeed + 1;
  } else if(x > 454) {
    rBounce();
  } 
  if(xDistance < 25){
    x = 24;
  }
  if(x2 < 235){
    x2 = xHeight;
    xHeight = xHeight + random(1, 4);
  }else if (x2 > 234){
    xHeight = xHeight - random(1, 4);
  }
  if (xHeight < 1){
    x2 = 0;
  }
}

/* These are functions to control the bounce of the ball
from the left or right paddle.*/
void lBounce(){
  x = xDistance;
  xSpeed = random(1, 15);
  xDistance = xDistance + xSpeed;
}
void rBounce(){
  xDistance = xDistance - xSpeed;
}
/*
void keyPressed(){
  if ( keyCode == 'w' )
      keys[0] = true;
  if ( keyCode == 's' )
      keys[1] = true;
  if ( keyCode == UP )
      keys[2] = true;
  if ( keyCode == DOWN )
      keys[3] = true;
  keyReleased();
}
void keyReleased(){
  if ( keyCode == 'w' )
      keys[0] = false;
  if ( keyCode == 's' )
      keys[1] = false;
  if ( keyCode == UP )
      keys[2] = false;
  if ( keyCode == DOWN ) 
      keys[3] = false;
} */


/*----------------------------------*\
|       CODED BY: RILEY CUTCHIN      |
|    Visual Representation of Pong   |
|         17 September 2014          |
\*----------------------------------*/



