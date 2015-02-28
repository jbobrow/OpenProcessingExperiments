
void setup() {
  size(200, 200);
  noStroke();
  noCursor();
  fill(255, 204, 0);
  rect(10, 10, 10, 10);
}

void draw () {
  background(0);
  rect(50, 50, 20, 10);
  fill(5, 204, 0);
  rect(50, 50, 200, 100);
  fill(255, 204, 0);
  rect(mouseX-5, mouseY-5, 10, 10);
}


