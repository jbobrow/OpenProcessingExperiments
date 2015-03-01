
void setup() {
  size (400, 400);
}

void draw() {
  background(127,0,127);

  drawStick (mouseX, mouseY);

}

void drawStick (int x, int y) {
  fill(255);
  ellipse (x, y, 60, 60);
  line (x, y+30, x, y +60);
  line (x-40, y+60, x+40, y+60);
 line(x,y+60,x,y+120);
 line(x,y+120,x-30,y+150);
 line(x,y+120,x+30,y+150);
 
} 

