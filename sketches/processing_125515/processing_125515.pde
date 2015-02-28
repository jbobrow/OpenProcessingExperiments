
float x = 0;
void setup() {
  size(400, 400);
  background(0);
  fill(100,0,100,50);
  strokeWeight(8);
}

void draw() {

ellipse(200, 200, x, x);
  x = x + 20;
  if (x > 400) {
    x = x -400;

  }
}

