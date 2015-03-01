
void setup() {
  size (250, 250);
}

void draw() {
  background(0);
  for (int i=0; i< 250; i=i+10) { 
    stroke(255+i, i, i);
    line(mouseX, mouseY, width, i);
    noCursor();
  }
}

