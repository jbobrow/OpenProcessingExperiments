
float x;
float speed = 1;

void setup() {
  size(300, 300);
  strokeWeight(6);
}

void draw() {
  background(255);

  if (x > 300 || x < 0) {
    speed = -speed;
  }
  x = x + speed;
  point(x, 150);
  
}
