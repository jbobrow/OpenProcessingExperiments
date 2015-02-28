
void setup() {
  size(501, 501);
  smooth();
}

void draw() {
  background(255);
  for (int i = 10; i < 500; i = i+20) {
  for (int j = 10; j < 500; j = j+20) {
    noFill();
    ellipse(i, j,20,20);
  }
  }
}

