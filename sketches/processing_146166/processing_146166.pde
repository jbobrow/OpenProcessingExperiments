
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

  // a circle is an ellipse with height = width
  stroke(255);
  fill(150);
  ellipse(200, 280, 80, 80);

  // a rectangle contains the circle
  noFill();
  rectMode(CENTER);
  rect(200, 280, 120, 120);
}

void draw() {
  // one white point at the position x = mouseX, y = mouseY, , beastly
  stroke(255);
  point(mouseX, mouseY);
}


