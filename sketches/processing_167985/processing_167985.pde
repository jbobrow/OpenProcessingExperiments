
void setup() {
  size(200, 500);
  background(255);
}

float xoff = 0.0;
float c;
float d;

void draw() {
  for (int x = 0; x <200; x++) {
    for (int y = 0; y <500; y++) {
      xoff = xoff + .01;
      float n = noise(xoff) * 255;
      stroke(0, n, n);
      point(x, y);
    }
  }
  noStroke();
  for (int bubs = 0; bubs < 200; bubs++) {
    c = random(10, 20);
    fill(0, random(150, 200), random(150, 200));
    ellipse(random(200), random(480, 500), c, c);
  }
  for (int bubs2 = 0; bubs2 < 60; bubs2++) {
    d = random(10, 20);
    fill(0, random(150, 200), random(150, 200));
    ellipse(random(200), random(460, 485), d, d);
  }
}
