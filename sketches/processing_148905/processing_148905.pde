
void setup() {
  size(500, 500);
  background(0, 100, 150);
}

void draw() {
  noStroke();
  fill(0, 100, random(150, 255));
  for (int i = 75; i < width-25; i = i + 50) {
    for (int j = 75; j < height-25; j = j + 50) {
      float f = random(45);
      ellipse(i, j, f, f);
    }
  }
  if (mousePressed) {
    frameRate(40);
    filter(ERODE);
  } else {
    frameRate(10);
  }
}

