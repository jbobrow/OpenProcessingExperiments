
int y;

public void setup() {
  y = 0;
  size(500, 500);
  smooth();
}

public void draw() {
  y = y + 1;
  background(255);
  ellipse(width / 2, y, 100, 100);
}

public void mousePressed() {
  y = 0;
}
