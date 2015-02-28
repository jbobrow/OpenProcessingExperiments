
int radius = 40;
float x = -radius;
float speed = 1;

void setup() {
  size(1000, 150);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(0, 26, 51);
  x += speed;
  ellipse(x, 70, 50, 50);
}


