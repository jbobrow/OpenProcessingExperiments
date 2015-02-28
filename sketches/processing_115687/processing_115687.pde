


void setup() {
  size(800, 200);
  noLoop();
  noStroke();
}

void draw() {
  background(160,163,173);

  for (int i=50; i<width; i+=100) {
    iphone(i, 100, int(random(50, 200)), random(-5, 5));
  }
}

void iphone(float x, float y, float a, float b) {
  pushMatrix();
  translate(x, y);
  rotate(b);
  fill(255,a);
  rect(0, 0, 60, 117, 7);
  ellipse(30, 107, 10, 10);
  rect(27, 5, 8, 2, 5);
  rect(5, 20, 50, 78);
  ellipse(18, 13, 3, 3);
  rect(25, 12, 13, 1, 3);
  popMatrix();
}



