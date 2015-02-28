
/**
 * A function for drawing N-pointed stars, as a collection of overlapping triangles.
 * Params:
 *     x & y: coords for the center of the star.
 *     base: length of the base of 1 triangle.
 *     lengthAsPercentOfBase: length of 1 point: multiplied by base.
 *     numPoints: the number of points (duh).
 *
 * Controls:
 * The sketch maps mouseX to the number of points (left is low),
 * and mouseY to the point length (down is low).
 * Click the mouse to toggle a transparent red border on the triangles,
 * which better shows the layout.
 */

void setup() {
  size(300, 300);
  background(0);
  fill(255);
  smooth();
}

void draw() {
  background(0);
  if (showStroke) {
    stroke(255, 0, 0, 150);
  } else {
    noStroke();
  }
  
  int numPoints = round(map(mouseX, 0, width, 2, 20));
  float pointLength = map(mouseY, 0, height, 5, 0);
  star(150, 150, 30, pointLength, numPoints);
}

void star(float x, float y, float base, float lengthAsPercentOfBase, int numPoints) {
  pushMatrix();
  translate(x, y);
  
  float halfBase = base / 2;
  float theta = TWO_PI / numPoints;
  for (int i = 0; i < numPoints; i++) {
    rotate(theta);
    triangle(0, -halfBase,
             0, halfBase,
             base * (1 + lengthAsPercentOfBase), 0);
  }
  
  popMatrix();
}

boolean showStroke = false;
void mouseClicked() {
  showStroke = !showStroke;
}
  

