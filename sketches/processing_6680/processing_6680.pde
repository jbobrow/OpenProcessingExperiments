
/**
 * Demonstrate the RRect class.
 * This is not an interactive drawing; it simply exercises
 * the RRect class for drawing rounded rectangles.
 */
RRect roundRect;

void setup() {
  size(350, 150);
  background(255);
  roundRect = new RRect(this);
  noFill();
  smooth();
  
  // a long rectangle using default CORNER mode
  roundRect.rrect(10, 10, 100, 50, 10, 5);
  
  // change rectangle mode; draw rounded square
  // with equal x and y radius
  // with different stroke and fill
  rectMode(CORNERS);
  stroke(255, 0, 0);
  fill(240, 255, 240);
  roundRect.rrect(70, 70, 140, 140, 8);
  
  // change rectangle mode again
  rectMode(CENTER);
  noStroke();
  fill(128, 128, 240);
  roundRect.rrect(200, 100, 40, 70, 6, 10);
  
  // use transformations
  rectMode(CORNER);
  pushMatrix();
  translate(250, 20);
  rotate(radians(30));
  noFill();
  stroke(0, 128, 0);
  roundRect.rrect(0, 0, 70, 40, 10, 6);
  popMatrix();
  
  // a radius of zero should produce an ordinary rectangle
  stroke(0);
  roundRect.rrect(270, 100, 40, 30, 0);
}


