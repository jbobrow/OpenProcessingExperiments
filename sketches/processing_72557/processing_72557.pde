
void setup() {
  size(600, 300);
}

int center = 30;

void draw() {
  background(0);
  smooth(); 

  float speed = map(mouseX, 0, width, 0, millis()/10000.0);

  for (int x = center; x <=width - center; x += center) {
    for (int y = center; y <=height - center; y += center) {
      float r = random (0, 150);
      float g = random (150, 255);
      float b = random (50, 200);
      fill (r, g, b, 145);
      ellipse (x, y, 50, 50);

      rotate (speed);
    }
  }
}
