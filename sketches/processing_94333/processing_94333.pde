
void setup() {
  size(200, 200);
  background(25);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}


void variableEllipse(int x, int y, int h, int z) {
  float speed = abs(x-h) + abs(y-z);
  stroke(speed);
  ellipse(x, y, speed, speed);
}
