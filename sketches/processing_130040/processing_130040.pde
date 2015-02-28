
/** 
 This is a simple implementation of the Koch curve using transformations
 to create the characteristic curve. 
 
 C. Andrews
 2014-01-23
 **/

void setup() {
  size(600, 600); 
  noLoop();
}


void draw() {
  background(255);
  translate(20, height/2);
  KochCurve(width - 40, 6);
}


/**
 This is the work horse. It will draw on Koch curve of length len.
 At the end, the origin will be at the right of the curve.
 
 The first generation of the curve is a straight line (0 iterations).
 Sucessive generations take each straight line and replace the middle 
 third with two sides of an equalateral triangle. The implementation
 does this in reverse by drawing a Koch curve of one generation down
 for each straight line in the shape. 
 **/

void KochCurve(float len, int iterations) {
  if (iterations > 0) {
    KochCurve(len/3, iterations - 1);
    rotate(radians(-60));
    KochCurve(len/3, iterations - 1);
    rotate(radians(120));
    KochCurve(len/3, iterations - 1);
    rotate(radians(-60));
    KochCurve(len/3, iterations - 1);
  }
  else {
    line(0, 0, len, 0);
    translate(len, 0);
  }
}



