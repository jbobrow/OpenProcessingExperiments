
void setup() {
  size(800,800);
  smooth();
  background(0);
}

void draw() {
  strokeWeight(3);
  stroke(mouseY, mouseX, 0);
  line (mouseX, 0, mouseY, height);
  stroke(mouseX, 0, mouseY);
  line(0, mouseY, width, mouseX);
  fill(0, 5);
  rect(0,0, width, height);
}

