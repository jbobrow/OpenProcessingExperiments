
/**
This is a quick sketch that shows how to use the frame loop to 
create a bouncing ball. This pseudo-simulation uses a modified force
of gravity in the form of an acceleration constant that is added to the 
velocity at every frame (or time step).

Note that we use variables as a way to keep track of the ball between
frames.

C. Andrews
2014-01-06
**/

float x, y; // the position of the ball
float vy; // the y component of the velocity
int diameter = 20; // the diameter of the ball
float acceleration = .9; // the acceleration constant


void setup() {
  size(800, 800);
  fill(80,0,255);
  
  // start the ball in the middle of the canvas with no initial velocity
  x = width / 2;
  y = 20;
  vy = 0;
 
}


void draw() {
  background(255);
  
  // draw the ball
  ellipse(x,y,diameter, diameter);
  
  // update the position of the ball
  y = y + vy;
  
  // check to see if it has hit the "floor" of the canvas
  if (y + diameter/2 >= height){
    // it did, reverse the velocity to simulate the strike
    y = height - diameter/2;
    vy = -vy;
  }else{
    // it didn't, update the velocity with the acceleration
    vy = vy + acceleration;
  }
 
}


