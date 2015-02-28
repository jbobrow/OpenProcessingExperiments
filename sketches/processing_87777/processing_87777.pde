
void setup() {
  size(610, 610);
  smooth();
  noStroke();
}

void draw() {
    background(255);
  float e = map(mouseX, 0, width, 80, 150);
  float f = map(mouseY, 0, height, 100,220);
  fill(f, 223, 31, e);

  float d =50;

  for (float i = (d/2); i<height; i+=d-10) {

    for (float j = (d/2); j<width; j+=d-10) {
      ellipse(j, i, d, d);
    }
  }
}



