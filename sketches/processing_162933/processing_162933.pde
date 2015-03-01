
float y = 50.0;
float speed = 1;
float radius = 40;

void setup() {
  size(200, 200);
  smooth();
  noStroke();
}

void draw() {
  background(#000000);
  fill(mouseX,mouseY,mouseX);
  ellipse(100, y, radius, radius);
  y = y + speed;
  if (y > height-radius) {
    speed = -1;
  }
  if (y < radius) {
    speed = 1;
  }
}

