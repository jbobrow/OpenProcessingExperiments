
float x;

public void setup() {
  x = 1;
  size(500, 500);
  smooth();
}

public void draw() {
  x = x * 1.1f;
  background(255);
  ellipse(x, height / 2, 100, 100);
}

public void mousePressed() {
  x = 1;
}

