
void setup() {
  size(400, 400);
}

void draw() {
  if(mousePressed == true) {
    line(mouseX, mouseY,pmouseX, pmouseY);
  }
}
