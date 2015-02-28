
void setup() {
  size(800, 600);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  float s = random(0, 50);
  for (int i=0;i<width;i=i+100) {
    for (int j=0;j<height;j=j+100) {
      fill(random(0, 255), random(0, 255));
      rect(i, j, 100, 100);
    }
  }
}
