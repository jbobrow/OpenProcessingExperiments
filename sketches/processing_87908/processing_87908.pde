

float angle = 0;

void setup() {
  size(400, 400);
}

void draw() {
  background (0);
  for (int i = 1; i < 500; i += 100) {
    for (int j = 1; j < 500; j += 100) {
      noStroke();
      fill (255);
      float d = .35 * (sin(angle) * 70) + 70;
      ellipse (i, j, d, d);
      fill (0);
      float e = .35 * (sin(angle+PI) * 35) + 35;
      ellipse (i, j, e - 10, e - 10);
      angle += 0.001;
    }
  }
}


