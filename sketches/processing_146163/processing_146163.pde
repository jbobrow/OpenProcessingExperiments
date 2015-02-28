
/*
 * workshop MIRADAS - trace(s) 2014
 * introduction to Processing
 * void setup(){} 
 * point-line-ellipse-rectangle
 * size()
 * ;;;;;;
 */

// setup is called just one time at the beginning
void setup() {

  size(400, 400);
  smooth();
  // black background
  background(0);

  // one white point at the position x = 200, y = 50
  stroke(255);
  point(200, 50);

  // one red horizontal line
  // Default stroke weight is 1
  stroke(255, 0, 0);
  line(50, 60, 350, 60);

  // one green horizontal line, thicker 
  stroke(0, 255, 0);
  strokeWeight(4);
  line(50, 80, 350, 80);

  // one blue horizontal line, beastly 
  stroke(0, 0, 255);
  strokeWeight(10); 
  line(50, 100, 350, 100);

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


