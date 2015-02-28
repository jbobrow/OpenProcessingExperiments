
void setup() {
  size(900, 600);
  background (#FF0000);
  //drawacircle(100,100,200);
  //drawacircle(300,300,20);
}

void drawacircle(int centx, int centy, int circlesize) {
stroke (0,0,255);
fill(#FFFF00);
ellipse(centx,centy,circlesize,circlesize);
}

void draw() {
if (mousePressed) {
background(#000000);
 } else {
background(#FF0000);
 }
  drawacircle(100,100,200);
  drawacircle(300,300,20);
}


