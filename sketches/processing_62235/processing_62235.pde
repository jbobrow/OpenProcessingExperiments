
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(110);
  noFill();
  scale(2.5);
  grid(0, 0, 0);
  grid(180, 500, 500);
  grid(90, 500, 0);
  grid(270, 0, 500);
}

void grid (float rot, float xtrans, float ytrans) {
  pushMatrix();
  translate(xtrans, ytrans);
  rotate(radians(rot));

  for (int i = 0; i < width; i++) {
    pushMatrix();
    for (int j = 0; j < height; j++) {
      triangle (0, 20, 10, 0, 20, 20);
      stroke(245);
      strokeWeight(0.5);
      translate(0, 20);
    }
    popMatrix();
    translate(20, 0);
  }
  popMatrix();
}



