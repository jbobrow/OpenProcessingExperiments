
int counter;
void setup() {
  size(480, 120);
}

void draw() {
  if (mousePressed) {
    fill(255,0);
  } else {
    fill(127, 200, 200);
  }
  ellipse(mouseX, mouseY, 60, 20);
}
