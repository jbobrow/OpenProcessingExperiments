
/*
 * Title: P05_03_Lines
 * By:    Barton Poulson (bartdoesart.com)
 * Date:  29 January 2013
 
Make an interesting sketch that uses variations on some of the following:
strokeWeight()
strokeCap()
strokeJoin()

 */

int   n = 9;  // Number of lines to draw
float d = 0;  // Displacement of lines based on cursor
int   h = 80; // Height of lines (from top of window)

void setup() {
  size(600, 200);
  noCursor();
}

void draw() {
  background(255);  
  
  fill(140);
  text("move the mouse", 10, height - 10);
  
  // Circle over cursor
  noStroke();
  fill(255, 200, 200);
  ellipse(mouseX, mouseY, 80, 80);
  
  // Lines
  d = (mouseX - width/2)/2;
  strokeWeight(20);
  stroke(200, 100);
  
  strokeCap(ROUND);
  line((1 * width / (n + 1)) , height + 10, (1 * width / (n + 1)) + d, h);
  strokeCap(SQUARE);
  line((2 * width / (n + 1)) , height + 10, (2 * width / (n + 1)) + d, h);
  strokeCap(ROUND);
  line((3 * width / (n + 1)) , height + 10, (3 * width / (n + 1)) + d, h);
  strokeCap(PROJECT);
  line((4 * width / (n + 1)) , height + 10, (4 * width / (n + 1)) + d, h);
  strokeCap(ROUND);
  line((5 * width / (n + 1)) , height + 10, (5 * width / (n + 1)) + d, h);
  strokeCap(PROJECT);
  line((6 * width / (n + 1)) , height + 10, (6 * width / (n + 1)) + d, h);
  strokeCap(ROUND);
  line((7 * width / (n + 1)) , height + 10, (7 * width / (n + 1)) + d, h);
  strokeCap(SQUARE);
  line((8 * width / (n + 1)) , height + 10, (8 * width / (n + 1)) + d, h);
  strokeCap(ROUND);
  line((9 * width / (n + 1)) , height + 10, (9 * width / (n + 1)) + d, h);
}
