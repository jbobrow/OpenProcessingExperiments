
void setup() {
  size(500, 500);
  background(255);
}

float t = 21;

void draw() {
  if (mousePressed) {
    frameCount = 0;
    background(255);
  }
  noFill();
  if (keyPressed) {
    if (key == 'z') {
      t = t + 2;
      background(255);
      frameCount = 0;
    }
    if (key == 'x') {
      t = t - 2;
      background(255);
      frameCount = 0;
    }
  }
  if (frameCount < t) {
    for (int i = 75; i < width-25; i = i + 50) {
      for (int j = 75; j < height-25; j = j + 50) {
        float f = random(10, 50);
        ellipse(i, j, f, f);
      }
    }
  }
}
