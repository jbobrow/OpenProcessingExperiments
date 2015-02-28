
/*
Iteration of Waves
by June-Hao Hou, DDes, (c) 2009

An example for the Interaction Design course at NCTU-Architecture.

This program demonstrates nested iterations and the use of
simple trigonometry function.
*/

float d = 0.0;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
}

void draw() {
  background(0);
  for (int y = 10; y < height; y += 10) {
    for (int x = 10; x < width; x += 10) {
      float r = cos(radians(x * y / 10.0 + d)) + 1;  // r = 0..2
      fill(88, 161, 255, r * 100 + 55);              // r affects opaqueness
      ellipse(x, y, 10, 10);
    }
  }
  d += 0.8;        // increase d by 0.8 for each redrawing
}

