
void setup() {
  size(620, 620);
}

void draw() {
  if (mousePressed) {
    fill(219,24,24);
  } else {
    fill(5,60,250);
  }
  triangle(mouseX, mouseY, 30, 75, 58, 20);
}
//This program creates a window that is 620 pixels wide and high.
//It creates a triangle that copies and moves based on the mouse movement
//upon clicking the mouse, the triangle will turn from blue to red

