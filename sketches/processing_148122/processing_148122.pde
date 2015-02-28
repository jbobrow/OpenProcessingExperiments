
int value = 0;

void setup() {
  size( 400, 400);
}

void draw() {
  fill(value);
  rect(25, 25, 50, 50);
}

void mouseMoved() {
  value = value + 10;
  if (value > 255) {
    value = 0;
  }
}

