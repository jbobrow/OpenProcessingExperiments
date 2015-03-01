
void setup() {
  size(840, 560);
  background(250);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  stroke(227, 99, 80);
  fill(179, 226, 227);
  rect(x, y, speed, speed);
  stroke(speed);
  stroke(179, 226, 227);
  fill(227, 99, 80);
  ellipse(x, y, speed, speed);
}
