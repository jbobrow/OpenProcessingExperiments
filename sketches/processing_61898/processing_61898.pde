
float y;

public void setup() {
  size(500, 500);
  smooth();
  noStroke();
}

public void draw() {
  y += 10;
  if (y > height) {
    y = 0;
  }
  fill(255, 255);
  rect(0, 0, width, height);
  fill(0);
  ellipse(width / 2, y, 100, 100);
}
