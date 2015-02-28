
void setup() {
  size(640, 480);
  background(110);
}

void draw() {
  if(mousePressed) {
  fill(mouseX-pmouseY+15, mouseY-pmouseX+10, mouseX/4+40);
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  }
  if(keyPressed) {
    background(110);
  }
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}


