
// This is a sketch for the forth week of "Introduction to Computational Arts" by Dr. Margaret Anne Schedel
// The goal of my sketch is to fulfill the requirements with minimal lines of code,
// but with an output, that could still be interesting and fun
int startX = 400;
int startY = 300;
void setup() {
size(800,600);
background(#FFFFFF);
stroke(#FFFFFF);
}

void draw() {
line(startX, startY, mouseX, mouseY);
if (mousePressed) {
  startX = mouseX;
  startY = mouseY;
  stroke(#000000);
}
if (keyPressed == true && key=='s') {
    saveFrame();
  }
}

