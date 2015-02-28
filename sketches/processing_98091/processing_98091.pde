
float angle = 0.0;

void setup() {
  size (500, 500);
  smooth();
}

void draw() {
  translate(mouseX, mouseY);
  rotate(angle);
  fill(17, 14, 237);
  stroke(255, 226, 0);
  rect(-15, -15, 30, 30);
  angle += 0.1;
}


