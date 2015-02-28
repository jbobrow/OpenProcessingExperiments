
void setup() {
  size(400, 400);
  smooth();
  noStroke();
}

void draw() {

  noCursor();
  rect(mouseX, mouseY, 10, 10);
  if (mousePressed) {
    mouseFollowing();
  }
}


