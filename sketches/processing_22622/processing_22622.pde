
void setup() {
  size(200,200);
}

void draw() {
  background(255);
  fill(0);
  ellipse(mouseX,mouseY,20,20);
}

void keyPressed() {
  if (key == ESC) {
    key = 0;
  }
}               
