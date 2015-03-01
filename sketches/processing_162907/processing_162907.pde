
float y = 50.0;
float speed = 1.0;
float radius = 15.0;

void setup() {
  size(100, 100);
  smooth();
  noStroke();
  frameRate (12);
  ellipseMode(RADIUS);
}

void draw() {
  background(random(200));
  ellipse(33, y, radius, radius);
  fill(178,140,216);
  y = y + speed;
  if (y > height+radius) {
    y = -radius;
    fill(216,140,140);
  } else if (y == height-radius) {
    speed = -1;
  }
  if (y==radius) {
    speed = 1;
  }
}




