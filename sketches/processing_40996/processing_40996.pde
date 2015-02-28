
void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  ellipseMode(CORNER);
  fill(255, 255, 255);
  ellipse(mouseX, mouseY, 100, 100);
  fill(76, 79, 198);
  ellipse(mouseX, mouseY+40, 25, 10);
  ellipse(mouseX+75, mouseY+40, 25, 10);
  fill(#C64C7F);
  ellipse(mouseX+40, mouseY+60, 20, 20);
  rect(mouseX+40, mouseY+100, 20, 140);
}


