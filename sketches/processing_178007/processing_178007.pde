
void setup() {
  size(680, 680);
}

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(random(255),37,84,30);
  }
  ellipse(mouseY, mouseX, 30, -20);
  ellipse(mouseX, mouseY, -30, 20);
}
