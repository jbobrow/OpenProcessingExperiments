
void setup() {
  size(500, 500);
  frameRate(35);
}
void draw() {
  background (random(50, 255),random(50, 255),random(50, 255));
  fill (random(50, 255),random(50, 255),random(50, 255));
  ellipseMode (CORNER);
  ellipse (random(20, 450), random(20, 450),random(20, 200), random(20, 200));
}
