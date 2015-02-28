
//This program draws horizontal lines in different colors. The lines move and the colors change as the user moves and clicks the mouse.

float a;

void setup() {
  size(640,360);
  stroke(255);
  a=mouseY;
}

void draw() {
  if (mousePressed) {
    stroke(0,mouseX,mouseY);
  } else {
    stroke(mouseY,0,mouseX);
  }  
  line(0, a, width, a);
  a = mouseY;
}
