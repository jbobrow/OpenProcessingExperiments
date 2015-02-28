
void setup() {
  size(600, 450);
  background (255);
}

void draw() {
  rect(mouseX, mouseY, 3, 3);
  rect(width-mouseX, mouseY, 3, 3);
  rect(mouseX,height-mouseY, 3,3);
  rect(width-mouseX,height-mouseY, 3,3);
}

