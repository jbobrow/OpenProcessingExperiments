
float angle = 0.0;

void setup() {
  size(671, 420);
  smooth();
}

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  rect(-15, -15, 30, 30);
  angle += 0.1;
}

