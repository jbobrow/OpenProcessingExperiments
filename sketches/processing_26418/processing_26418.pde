
void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  stroke(0);
  strokeWeight(abs(pmouseX - mouseX));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

