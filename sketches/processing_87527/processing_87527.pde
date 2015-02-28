
/*
 * Title: P05_04_Placement
 * By:    Barton Poulson (bartdoesart.com)
 * Date:  31 January 2013
 *
 *  Make an interesting sketch that uses variations on one or more of the following:
 *  - rectMode()
 *  - ellipseMode()
 */

float d = 0;  // Displacement of lines based on cursor
int   s = 80; // Size of rectangles

void setup() {
  size(600, 200);
  strokeWeight(15);
}

void draw() {
  background(255);
  fill(140);
  text("move the mouse", 10, height - 10);

  noFill();

  // Rectangle that resizes with mouse
  rectMode(CORNERS);
  strokeJoin(BEVEL);
  stroke(100, 200, 100, 100);
  rect(10 + s/2, 10 + s/2, mouseX, mouseY);

  // Square that stays put in top left corner
  rectMode(CORNER);
  strokeJoin(MITER);
  stroke(200, 100, 100, 100);
  rect(10, 10, s, s);
  
  // Square that follows mouse
  rectMode(CENTER);
  strokeJoin(ROUND);
  stroke(100, 100, 200, 100);
  rect(mouseX, mouseY, s, s);
}
