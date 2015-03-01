
void setup() {
  size(100, 100);
  noFill();
}

void draw() {
  background(204);
  float t = map(mouseX, 0, width, -5, 5);
  curveTightness(t);
  beginShape();
noFill();
curve(5, 26, 5, 26, 73, 24, 73, 61);
curve(5, 26, 73, 24, 73, 61, 15, 65);
fill(255);
ellipseMode(CENTER);
int steps = 6;
for (int i = 0; i <= steps; i++) {
  float k = i / float(steps);
  float x = curvePoint(5, 5, 73, 73, k);
  float y = curvePoint(26, 26, 24, 61, k);
  ellipse(x, y, 10, 5);
  x = curvePoint(5, 73, 73, 15, k);
  y = curvePoint(26, 24, 61, 65, k);
  ellipse(x, y, 15, 10);
}
  endShape();
}


