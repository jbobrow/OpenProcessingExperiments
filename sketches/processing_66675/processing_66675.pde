
void setup() {
  size(300, 300);
  background(230);
  smooth();
  noStroke();
}

void draw() {
  if (mousePressed) {
    shape(mouseX, mouseY);
  }
}
void shape(int x, int y)  {
  fill(random(255), random(255), random(255),  100);
  rect(mouseX, mouseY, 33, 33);
}

void keyPressed() {
  saveFrame("PSimage.jpeg");
}

