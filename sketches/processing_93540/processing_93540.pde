
void setup() {
  size(400, 400);
  background(50);
}

void draw() {
  stroke(255, 255, 255);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}


