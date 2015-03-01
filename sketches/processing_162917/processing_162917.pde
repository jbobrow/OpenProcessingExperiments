
float y = 50.0;
float speed = 5.0;
float radius = 15.0;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  ellipse(250, y, radius, radius);
  ellipse (100, y, radius, radius);
  ellipse (400, y, radius, radius);
  y = y + speed;
  if (y > height || y < 0) {
    speed = -speed;
  }
}
