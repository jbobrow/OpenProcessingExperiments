
//PS_2 Question 3
//Milton Sukhabut
void setup() {
  size(500, 500);
  background(55);
  noStroke();
}

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    brush(mouseX, mouseY);
  }
}
void brush (int x, int y) {
  fill(mouseX, mouseY, 130, 100);
  ellipse(mouseX, mouseY, mouseX, mouseY);
  ellipse(mouseX, mouseY, 65, 140);
  ellipse(mouseX, mouseY, 80, 200);
}


