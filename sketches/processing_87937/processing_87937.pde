
/*
 *  Title: P06_02_ForLoops_2
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  02 February 2013
 *
 *  Assignment:
 *    Create a sketch with a pair of nested for loops
 *    to create rows and columns of objects. The sketch
 *    may be static or dynamic.
 */

int d = 50;  // diameter of circles
int i = 0;   // Counter variable

void setup() {
  size(600, 200);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);  // Use HSB 360° colors
  frameRate(1);
}

void draw() {
  background(0, 0, 0);
  for (int y = d/2; y < height; y += d) {   // Loop through rows
    for (int x = d/2; x < width; x += d) {  // Loop through columns
      // Use modulo on counter to cycle through colors
      fill(i % 360, 100, 100, 100);
      // Increment counter by 3 steps
      i += 3;
      ellipse(x, y, d, d);
    }
  }
}
