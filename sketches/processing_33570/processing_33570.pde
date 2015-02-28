
int value = 0;

void setup(){
  size(500,500);
  background(0);
}

void draw() {
  fill(value);
  ellipse(206, 200, 305, 305);
}

void mouseMoved() {
  value = value + 10;
  if (value > 255) {
    value = 0;
  }
}

