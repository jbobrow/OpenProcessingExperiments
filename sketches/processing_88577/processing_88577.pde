
void setup() {
  size (400, 400);
  smooth();
}

void draw() {
  background(0, 0, 0);
  for (int i=0; i<400; i+=40) {
    for (int j=0; j<400; j+=40) {
      stroke(250, 0, 0);
      line(i, j, 400, 0);
      stroke(255, 255, 255);
      line(j, i, 400, 0);
    }
  }
}



