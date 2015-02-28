

void setup() {
  size(400,400);
  background(255);
}

void draw() {
  if (mousePressed) {
   drawKreuz(mouseX, mouseY);
  }
}

void drawKreuz(int x, int y) {
  int size=x-y;
  line(x,y,x+size, y);
  line(x,y,x,y+size);
  line(x,y,x-size, y);
  line(x,y,x,y-size);
}
 
