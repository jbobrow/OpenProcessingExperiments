
// ratate practice
// by chen hsin chang
void setup() {
  size(500, 500);
  background(208, 175, 140);
}

void draw() {
  background(0);
  translate(mouseX, mouseY);
  for (float i =0;i<500;i++) {
    rotate(mouseX);
    stroke(mouseX, 150, 150);
    line(i, i, i+500, i+500);
  }
}



