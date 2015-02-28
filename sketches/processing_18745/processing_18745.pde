
void setup() {
  size(250, 250);
  background(0);
  smooth();
}

void draw() {
  stroke(255);
  // Draw a line from previous mouse location to current mouse location.
  line(pmouseX, pmouseY, mouseX, mouseY);
}


