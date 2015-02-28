
int top = 0;
int right = 0;
int left = 0;
int bottom = 0;
int tx = 0;
int ty = 0;
int lx = 0;
int ly = 500;
int rx = 500;
int ry = 0;
int bx = 500;
int by = 500;
void setup() {
  size(500, 500);
  background(255);
}

void draw() {

  //  draw a line from centre to top left corner
  //  increase x number until x reaches 500.

  line(mouseX,mouseY, tx, ty);
  line(mouseX,mouseY, lx, ly);
//  line(mouseX,mouseY, rx, ry);
 // line(mouseX,mouseY, bx, by); //at end change 250 to mouse x mouse 

  if (tx<500) {
    tx=tx+5;
    ty=0;
  }
  else {
    tx = 500;
  }
//////////////////////  done to here
    if (ly>0) {
    ly=ly-5;
    lx=0;
  }
  else {
    ly = 0;
  }
///////////////////////
  if (rx<500) {
    rx=rx+5;
    ry=0;
  }
  else {
    rx = 500;
  }
  /////////////////////
    if (bx<500) {
    bx=bx+5;
    by=0;
  }
  else {
    bx = 500;
  }

  //  if(x<500) {
  //    x = 500;
  //  }
  //  line(x, y, 250, 250);
  //  x=x+20;
  //  y=500;
}
