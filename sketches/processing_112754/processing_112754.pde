
void setup() {
  size(256, 100);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  float s = random(0, 50);
  for (int i=0;i<width;i=i+1) {
    fill(i);
    rect(i, 0, 1, 100);
  }
}
