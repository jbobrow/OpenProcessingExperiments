
void setup() {
  size(480, 400);
  background(255, 204, 0);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(204, 102, 0);
  }
  rect(mouseX, mouseY, 55, 55);
}




