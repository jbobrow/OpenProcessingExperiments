
/*************************************

 *Assignment 03
 *Name: Leslie Tjing
 *Email: Ltjing@haverford.edu
 *Course: CS 110- Section 02
 *Submitted: 2-14-2012
 * 
 * This is PrimiShape Havoc. Iteration (While loop) was used to fill the canvass with teal squares.
   A yellow bouncing ball will also trace continuously to form two diamonds.
 
 **************************************/
float xPos;
float yPos; 
float xVel;
float yVel;

void setup () {
  size (600, 600);
  background (0, 0, 255);
  noStroke ();
  smooth ();
  xPos=width/2;
  yPos=height/2;
  xVel =1;
  yVel =2;
}   


void draw () {
  
// Draw PrimiShape Havoc Diamond Tracer
  xPos= xPos +xVel;
  yPos= yPos +yVel;
  fill (244, 247, 55);
  noStroke ();
  ellipse (xPos, yPos, 15, 15);
  
  if (yPos>height || yPos< 0) {
    yVel =yVel *-1;
  }
  if (xPos >width || xPos <0) {
    xVel =xVel *-1;
  }
  
// Draw PrimiShape Havoc Grid Squares
  int w=width;
  int h=600; 
  float x=0;
  while (x<w) {
    float y=0;
    while (y<h) {
      if (random (800) <5) {
        noStroke ();
        fill(33, 216, 206, 80);
        rect(x, y, 38, 38);
      }
      y=y+40;
    }
    h=h+600;
    x=x+40;
  }
}


