
float x, y;
final float easing = 0.01f;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
  x += (mouseX - x) * easing;
  y += (mouseY - y) * easing;
  ellipse(x, y, 30,30);
}
