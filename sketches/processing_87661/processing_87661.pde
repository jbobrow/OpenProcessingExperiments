
void setup() {
  size(640, 480);
  smooth();
}

void draw() {
  background(250, 185, 255);

  for (int i=0; i<width; i+=15) {
    for (int j=0; j<height; j+=15) {
      if ((i % 2 == 0) && (j % 2 == 0)) {
        fill(180, 100, 252, 90);
      }
      else {
        fill(50, 70);
      }
      rect(float(i), float(j), random(15, 25), random(15, 25), random(10, 15), random(5, 10), random(5, 10), random(5, 10));
    }
  }
}


