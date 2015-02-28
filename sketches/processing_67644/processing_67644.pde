
void setup() {
  size(640, 200);
  background(102);
}

void draw() {
  stroke(255);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

