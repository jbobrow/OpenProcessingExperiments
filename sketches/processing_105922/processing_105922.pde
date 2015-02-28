
// Drawing a circle mathematically

void setup() {
  size(400, 400);
  noLoop();
}

void draw() {
  background(180);
  stroke(0);
  noFill();
  // Draw a regular circle using Processing ellipse() function.
  circle(100, 100, 80);
  // Draw a circle mathematically by line segments.
  circle_m(300, 100, 80, 24);
}

void circle(float cx, float cy, float radius) {
  ellipse(cx, cy, radius*2, radius*2);
}

void circle_m(float cx, float cy, float radius, int sides) {
  float angInterval = TWO_PI / sides;
  PVector currPt, prevPt;  // Current point and previous point.

  currPt = new PVector(0, 0);
  prevPt = new PVector(0, 0);;
  
  for (int i = 0; i <= sides; i++) {
    currPt.x = cos(i * angInterval) * radius + cx;
    currPt.y = sin(i * angInterval) * radius + cy;
    // Don't draw the line when i == 0, because to draw a line we 
    // need two points.
    if (i > 0) {
      line(prevPt.x, prevPt.y, currPt.x, currPt.y);
      line(cx, cy, currPt.x, currPt.y);
    }
    prevPt = currPt.get();  // Copy current vector to previous vector.
  }
}


