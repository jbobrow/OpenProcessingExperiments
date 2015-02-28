
void setup() {
  size(400,400);
  smooth();
}

void draw() {
  line(mouseX,mouseY,mouseX,mouseY);
  line(mouseY,mouseX,mouseX,mouseY);
  line(mouseX,mouseX,mouseY,mouseX);
  line(mouseY,mouseY,mouseY,mouseX);
  line(mouseY,mouseY,mouseX,mouseY);
  line(mouseX,mouseY,mouseY,mouseY);
}

