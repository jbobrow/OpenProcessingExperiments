
/*
Program Title: A2-2
 Program Description:Write a procedure for drawing a simple character with at least two different parameters and use your
 procedure at least three times with different values of its parameters.
 By Jillian Warren, September 28, 2012
 Comments: IAT 800 - Assignment 2 
 
 
 **Inspiration from: http://krazydad.com/tutorials/circles_js/
 */




//***Global variables
float goldenRatio = (sqrt(5)+1)/2 - 1;  // golden ratio
float goldenAngle = goldenRatio * TWO_PI;  // golden angle
float largeRadius;
float ratio;
float sinCosAngle;
float xCenter;
float yCenter;
float spiralRadius;



//***to be executed once
void setup () {
  size (1200, 800);
  background (255); // white
  smooth();
  frameRate (5);
  ellipseMode (RADIUS);
  fill (0);
}//end setup



//*** procedure to draw spiral characters. Arguements: numberofCircles used for # of circles that makes up spiral, circle size dictates
// size of circles that make up spiral, xPos and yPos are used in determination of location of circles and therefore overall spiral
void drawSpirals (int numberOfCircles, int circleSize, int xPos, int yPos) {

  //initialize
  largeRadius = width * random (.10, .30); // used for radius of the whole spiral

  //create circles spiraling outward to create full spiral
  for (int i = 1; i <= numberOfCircles; ++i) {

    ratio = i/ (float) numberOfCircles;

    sinCosAngle = i*goldenAngle;

    spiralRadius = ratio * largeRadius;

    xCenter = xPos + cos(sinCosAngle) * spiralRadius;
    yCenter = yPos + sin(sinCosAngle) * spiralRadius;

    ellipse (xCenter, yCenter, circleSize, circleSize);
  }//end for
}//end drawSpirals




//**create method to change color
void changeColor () {
  noStroke();

  //local variable
  int r = (int) random (255);
  int g = (int) random (255);  
  int b = (int) random (255);
  int grayScale = (int) random (0, 230);
  int opacity = 80;

  //if mouse pressed switch to color fill, otherwise fill gray scale
  if (mousePressed) {
    fill (r, g, b, opacity);
  }//end if
  else {
    fill (grayScale, opacity);
  }//end else
}//end changeColor





//***Draw three different spirals
void draw () {

  //if key is pressed, wipe clean the background
  if (keyPressed) {
    background (255);
  }//end if

  //top left
  changeColor ();
  drawSpirals (800, 2, 50, 50);

  //middle
  changeColor();
  drawSpirals (400, 4, width/2, height/2);

  //bottom right
  changeColor();
  drawSpirals (200, 8, width-50, height-50);

  //delay (100);
}//end draw



