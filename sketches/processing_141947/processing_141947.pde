
void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  noStroke();
  bezier(random(500), random(500), random(500), random(500), random(500), random(500), random(500), random(500));
  fill(random(100, 255), 0, 0);
  if (mousePressed) {
    filter(DILATE);
  }
  if (keyPressed) {
    filter(BLUR, 1);
  }
}
