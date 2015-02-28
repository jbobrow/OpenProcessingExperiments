
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {
  noStroke();
  colorMode(RGB);

  for (int i=0;i<width;i+=2) {
    for (int j=0;j<height;j+=2) {
      fill(i, j, 200);
      rect(i, j, 2, 2);
    }
  }
}



