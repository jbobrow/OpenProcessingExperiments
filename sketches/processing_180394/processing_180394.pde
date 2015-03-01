
void setup() {
  size(680, 680);
}

void draw() {
  if (mousePressed) {
    fill(600,478,693);
  } else {
    fill(50,340,324);
  }
  ellipse(mouseX, mouseY, 20, 8);
  ellipse(mouseY, mouseX, 8, 20);

}
