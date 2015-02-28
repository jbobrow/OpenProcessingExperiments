
//Will Cordes
//Lecture 5.1

// TEST COLORS
// blue #2E599D
// light blue #4882DE
// deep blue #083171
// green #7D9D2E
// red #AF3227
// violet #7E30CE
// maroon #711224
// yellow #CCD823
// orange #DE8F28

float dotSize = 4; // extents of smaller ellipses
float radius = 20; // radius of groupings

void setup() {
  size(400, 400);
  colorMode(HSB, width);
  background(#711224);
  smooth();
}

void draw() {
  for (int x = 20; x < width; x += 45) { // width
    for (int y = 20; y < height; y += 45) { // height
      circleDot(x,y); // circleDot central coordinates
    }
  }
}

void circleDot(float a, float b) {
  for (float i = 0; i < 360; i += 10) {
    pushMatrix();
    translate(a, b); // conform to grid
    rotate(radians(i));  // rotate origin
    translate(radius, 0); // move origin to radius
    noFill();
    stroke(random(width));
    ellipse(0, 0, dotSize, dotSize); // center and extents
    popMatrix();
    noLoop(); // stops from being redrawn
  }
}

