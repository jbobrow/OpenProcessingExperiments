
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * Modified by Jason Prine
 *
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 * 
 */

void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  noStroke();
}


void draw() {
  background(180);
  noStroke();

  int num = 5;  //number of circles in a row
  int margin = 80;  //left, right, top and bottom margin

  float gutter =0; //distance between each circle
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1); //size of circle

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;
      println (circleNumber); //debugging
      float tx = margin + cellsize * i + gutter * i; //margin + length of circles + length of gutter
      float ty = margin + cellsize * j + gutter * j;

      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0,circleNumber);
    }
  }
}//end of draw 


void movingCircle(float x, float y, float size, float angle, float shape) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(0);
  strokeWeight(2);
  fill(140, 180);
  
  if (shape%2 == 0) { //even value; create a square
    rect(x, y, size, size); // square
    stroke(255, 0, 0); // red line
  } else { //odd value; create a circle
    ellipse(x, y, size, size); // circle
    stroke(0, 0, 255); //blue line
  } //end if
  
  
  line(y, x, tempY, tempX); // red line ; reversed endpoints for clockwise motion
}

