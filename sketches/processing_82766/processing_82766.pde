
float x = 0.0;

void setup() {
size (400, 400)
}

void draw() {
  background(255);
  fill(0);
  ellipse (x, height/2, 10, 10);
  x++;
  if (x>100) {
  x=0;
  }
}
