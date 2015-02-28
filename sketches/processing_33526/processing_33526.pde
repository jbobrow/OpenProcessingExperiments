
int click;
int mousePx;
int mousePy;

void setup()
{
  size(400, 400);
  background(0, 0, 0);
  click = 0;
}


void draw ()
{
}

void mouseClicked() {
  smooth();
  click= click+1;
  ellipse (mouseX, mouseY, 30, 30);

  if  (click == 0) {
    background(0);
  }
  //to erase the first circle

  else if (click==1) {
    ellipse (mouseX, mouseY, 30, 30);
  }
  else if (click==2) {
    ellipse (mouseX, mouseY, 30, 30);
    mousePx=mouseX;
    mousePy=mouseY;
  }
  else if (click>=3) {
    background(0);
    ellipse (mousePx, mousePy, 30, 30);
    ellipse (mouseX, mouseY, 30, 30);
    mousePx=mouseX;
    mousePy=mouseY;
  }
}


