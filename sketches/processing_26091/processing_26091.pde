
void setup() {
  size(800, 800);
  background(255);
  smooth();
}

void draw() {
  stroke(0);
  strokeWeight(abs(pmouseX - mouseX));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

