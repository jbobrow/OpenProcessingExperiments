
int x1, y1, x2, y2, x3, y3;
int lineCount = 0;
int triangleCount = 0;
int toggleValue;

void setup() {
  size(600, 600);
  x1 = 0; 
  y1 = height;
  x2 = width; 
  y2 = height;
  x3 = width/2; 
  y3 = 0;
  background(0);
  colorMode(RGB, 1.0);
  //draw2(x1, y1, x2, y2, x3, y3);
  //println("lineCount=" + lineCount + " and triangleCount=" + triangleCount);
  //draw1(x1, y1, x2, y2, x3, y3);
}

void draw() {
  draw1(x1, y1, x2, y2, x3, y3);
}

void draw1(int X1, int Y1, int X2, int Y2, int X3, int Y3) {

  smooth();

  fill(random(0, 1.0), random(0, 1.0), random(0, 1.0));
  int oldx1 = X1;
  int oldy1 = Y1;
  int oldx2 = X2;
  int oldy2 = Y2;
  int oldx3 = X3;
  int oldy3 = Y3;

  X1 = (oldx2 + oldx3)/2;
  Y1 = (oldy2 + oldy3)/2;

  X2 = (oldx1 + oldx3)/2;
  Y2 = (oldy1 + oldy3)/2;

  X3 = (oldx1 + oldx2)/2;
  Y3 = (oldy1 + oldy2)/2; 
  triangle(X1, Y1, X2, Y2, X3, Y3);

  if ((abs(oldx1-X2)) > 2) {
    draw1(oldx1, oldy1, X2, Y2, X3, Y3);
  }

  if ((abs(oldx2-X3)) > 2) {
    draw1(X3, Y3, oldx2, oldy2, X1, Y1);
  }

  if ((abs(oldx3-X2)) > 2) {
    draw1(X2, Y2, oldx3, oldy3, X1, Y1);
  }
}



