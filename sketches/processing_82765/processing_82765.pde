
float x = 0.0;

void setup() {
  size (200, 200);
  noLoop();
}

void draw() {
  ellipse (x, 100, 30, 30);
  x+=10;
}
