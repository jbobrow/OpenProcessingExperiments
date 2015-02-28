
void setup () {
  size (300, 300);
  stroke (255);
  frameRate(30);
}

float y = 100;

void draw() {
  background(0);
  y = y - 1;
  if (y < 0) {
    y = height;
  }
  line(0, y, width, y);
}


