

void setup() {
  size(600, 600);
}

void draw() {
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      famousMouse((i+1) * 100, (j+1) * 100, i*50, j*50, 0);
    }
  }
}

void famousMouse(int x, int y, int red, int green, int blue) {
  fill(0);
  ellipse(x-25, y-20, 30, 30);
  ellipse(x+25, y-20, 30, 30);
  fill(red, green, blue);
  ellipse(x, y, 50, 50);
}



