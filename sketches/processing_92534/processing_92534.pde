
int X, Y;
int nX, nY;
int pX, pY;
int delay = 16;
boolean record = true;

void setup() {
  size(960, 540);
  smooth();
  noFill();
  stroke(#000000);
  background(#FFFFFF);
}

void draw() {
  
  X += (nX-X)/delay;
  Y += (nY-Y)/delay;
  nX = mouseX;
  nY = mouseY;

  if (mousePressed) {
    line(X, Y, pX, pY);
  }

  pX = X;
  pY = Y;
}


