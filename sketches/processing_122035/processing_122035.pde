


void setup () {
  size(480,480);
  smooth();
}

void draw() {
int xstart = 240;
int ystart = 240;
int xlast = 240;
int ylast = 240;

  while (mousePressed==true) { //change the color when i click the mouse
      xlast = xstart;
      ylast = ystart;
      line(xlast,ylast,xstart,ystart);
      xstart = xlast+int(random(10,-10));
      ystart = ylast+int(random(10,-10));
    }
}
// void mouseReleased(){
//   stroke(random(0,255),random(0,255),random(0,255),120);
// }
