
float x;
float y;
float easing = 0.25f;

public void setup() {
  size(500, 500);
  smooth();
  noStroke();
}

public void draw() {
  x += (mouseX - x) * easing;
  y += (mouseY - y) * easing;
  fill(255, 255);
  rect(0, 0, width, height);
  fill(0);
  ellipse(x, y, 100, 100);
}
