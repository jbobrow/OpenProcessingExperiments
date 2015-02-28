
/*
 * workshop MIRADAS - trace(s) 2014
 * introduction to Processing
 * void setup(){} - void draw(){}
 * move
 * point-line-ellipse-rectangle
 * size()
 * ;;;;;;
 */

// declare and initialize one variable
// y position of the first point of the lines
float deltaYPos = 0;


// setup is called just one time at the beginning
void setup() {

  size(400, 400);
  smooth();
}


// draw is called on each frame again
void draw() {
  // background in draw clear the frame
  background(0);

  // one red horizontal line
  // Default stroke weight is 1
  strokeWeight(1);
  stroke(255, 0, 0);
  line(50, 60+deltaYPos, 350, 60);

  // one green horizontal line, 20 pix more down, thicker 
  stroke(0, 255, 0);
  strokeWeight(4);
  line(50, 80+deltaYPos, 350, 80);

  // one blue horizontal line, 40 pix more down, fat 
  stroke(0, 0, 255);
  strokeWeight(10); 
  line(50, 100+deltaYPos, 350, 100);

  // now move down the y position 0,5 pix each frame
  deltaYPos += 0.5;

  // one white point at the position x = 200, y = 150, , beastly
  stroke(255);
  point(200, 150);

  // a circle is an ellipse with height = width
  fill(150);
  ellipse(200, 280, 80, 80);

  // a rectangle contains the circle
  noFill();
  rectMode(CENTER);
  rect(200, 280, 120, 120);
}


