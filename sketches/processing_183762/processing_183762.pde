
void setup() {
  size (250, 250);
}

void draw() {
  background(0);
  for (int i=5; i< 250; i=i+10) { 
    stroke(255, 0, 0);
    line(mouseX, mouseY, width, i);
    line(mouseX, mouseY, i, height);
    line(mouseX, mouseY, 0, i);
    line(mouseX, mouseY, i, 0);

    noCursor();
  }
}

