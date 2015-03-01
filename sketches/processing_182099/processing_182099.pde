
int Y_AXIS = 0;
int X_AXIS = 1;
color b1, b2, w, g;

void setup() {
  size(640, 360);
  
  b1 = color(#002288);
  b2 = color(#885577);
  w = color(200);
  g = color(128);
  
  noLoop();
}

void draw() {
  // Sky
  drawGradient(0, 0, width, height, b1, b2, Y_AXIS);
  drawCloud(100, 100);
  drawCloud(530, 210);
  drawCloud(450, 250);
}

void drawCloud(int x, int y) {
  drawRadialGradient(x, y, 50, w, g);
  drawRadialGradient(x + 50, y + 30, 47, w, g);
  drawRadialGradient(x + 110, y + 28, 42, w, g); 
  drawRadialGradient(x + 80, y - 17, 55, w, g);
  drawRadialGradient(x + 30, y - 20, 60, w, g);
}

void drawGradient(int x, int y, float w, float h, color c1, color c2, int axis) {
  noFill();
  
  int bottomBoundary = y + (int)h;
  int rightBoundary = x + (int)w;
  
  if (axis == Y_AXIS) {
    for (int i = y; i <= bottomBoundary; i++) {
      // Map takes a # from a given range, scales the range, returns the #'s new val
      float ratio = map(i, y, bottomBoundary, 0, 1);
      // Yay lerping!
      color c = lerpColor(c1, c2, ratio);
      stroke(c);
      line(x, i, rightBoundary, i);
    }
  } else {
    for (int i = x; i <= rightBoundary; i++) {
      float ratio = map(i, x, rightBoundary, 0, 1);
      color c = lerpColor(c1, c2, ratio);
      stroke(c);
      line(i, y, i, bottomBoundary);
    }
  }
}

void drawRadialGradient(int centerX, int centerY, float radius, color centerColor, color outerColor) {
  noFill();
  ellipseMode(RADIUS);
  strokeWeight(1.75);
  for (int i = 0; i <= radius; i++) {
    float ratio = i / radius;
    color c = lerpColor(centerColor, outerColor, ratio);
    stroke(c);
    ellipse(centerX, centerY, i, i);
  }
}
