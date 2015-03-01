
void setup() {
  size(680,680);
}

void draw() {
  if (mousePressed) {
    fill(234,456,678);
  } else {
    fill(random(255),20,255,50);
  }
  ellipse(mouseX, mouseY, -30, 20);
  ellipse(mouseY, mouseX, -20, 30);
}
