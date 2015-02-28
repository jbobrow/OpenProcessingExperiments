
void draw() {
  if (mousePressed) {
   drawKreuz(mouseX, mouseY);
  }
}
void drawKreuz(int x, int y) {
  line(x,y,x+10, y);
  line(x,y,x,y+10);
  line(x,y,x-10, y);
  line(x,y,x,y-10);
}



