
float rad = 50;
float speed=8;
float angle;


void setup() {
  size(800, 400);
}

void draw() {
  background(0);
  angle += speed;

  float y = sin(radians(angle)) * rad + height/2;

  fill(mouseY, mouseX,random(255));

  ellipse(angle, y, 40, 40);

  if (angle > width) {
    speed = -8;
  }
  if (angle < 0) {
    speed = 8;
  }
}

