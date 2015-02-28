
void setup() {
  size(800, 200);
  background(255);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}
void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  float r = random(255);
  float s = random(255);
  float t = random(255);
  fill(r,s,t);
  ellipse(x, y, speed, speed);
}
