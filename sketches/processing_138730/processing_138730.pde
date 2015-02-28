
float x = -25;
float y = 0;
int counter = 0;

void setup() {
  size(800, 600);
}

void draw() {
  rect(x, y, 50, 25);
  x += 50;
  if (x > width) {
    y += 25;
    x = 0;
  }
  if (x == width) {
    y += 25;
    x = -25;
  }
}

