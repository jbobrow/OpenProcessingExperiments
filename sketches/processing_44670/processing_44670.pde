
void setup() {
  size(420, 420);
  smooth();
}

void draw() {
  ellipse(mouseX, 80, mouseX, 50);
  line(90, mouseY, 220, mouseY);
  line(mouseX, 200, mouseY, 90);
}


