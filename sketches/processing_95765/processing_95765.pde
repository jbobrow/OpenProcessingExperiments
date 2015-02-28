
/*
Mapped Color
 Jennifer Presto
 Example for BFA class in Creative Computing
 April 9, 2013
 */

float red;
float green;
float blue;

float incrementor = 0;

void setup(){
  size(400, 600);
  noStroke();
  }

void draw(){
  // draw a rectangle with red and blue values
  // mapped to the mouse position
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = 0;
  fill(red, green, blue);
  rect(100, 100, 200, 400);
  
  // draw a circle with the blue mapped
  // to an oscillating number
  blue = map(cos(incrementor), -1, 1, 0, 255);
  fill(0, 0, blue);
  ellipse(width/2, height/2, 150, 150);
  
  // increase incrementor each frame
  // to change the blue value for the circle
  incrementor += 0.05;
  
  // So what's happening with that cosine function up there?
  println("The cosine of " + incrementor + " is " + cos(incrementor) + ".");
}




