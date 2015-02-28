
void setup() {
  size (400, 400);
  smooth();
}

void draw() {
  background(0, 0, 0);
  for (int i=0; i<400; i+=60) {
    for (int j=0; j<400; j+=20) {
      fill(31, 124, 89);
      stroke(255,255,255);
      ellipse(i, j, 40, 40);
    }
  }
  for (int i=30; i<400; i+=60) {
    for (int j=0; j<400; j+=60) {
      fill(255,255,255);
      stroke(31, 124, 89);
      ellipse(i, j, 40, 40);
    }
  }
}



