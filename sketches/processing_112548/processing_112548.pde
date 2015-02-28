
void setup() {
  size(400, 400);
  background(0, 0, 0);
}

void draw() {
  stroke(mouseX, mouseY, 150);
  strokeWeight(8);
  fill(225, 0, 0);
  rect(100, 100, 200, 200);

  stroke(mouseX, mouseY, 150);
  fill(mouseX, mouseY, 255);
  rect(50, 50, 50, 50);

  stroke(mouseX, mouseY, 150);
  fill(225, 0, 0);
  rect(300, 300, 50, 50);
}



