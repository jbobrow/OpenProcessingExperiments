
float x = 100;
float y = 10;

float speed = 0;
float gravity = 0.1;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  fill(0);
  rectMode(CENTER);
  rect(x, y, 10, 10);

  speed = speed + gravity;
  y = y + speed;

  if (y > height-5) {
    speed = speed * -0.95;
  }
}
