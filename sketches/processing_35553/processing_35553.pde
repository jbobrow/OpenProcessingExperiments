
void setup() {
  size (300, 300);
  smooth ();
  background (0,0,0);
  noStroke();
  ellipseMode (CENTER);
  ellipse (100, 150, 50, 50);
  ellipse (200, 150, 50, 50);
}

int x = 0;
int y = 0;
void draw() {
  colorMode (HSB);
  fill(HSB,y,x,30);
  ellipse (100, 150, x, y);
  ellipse (200, 150, x, y);
  ellipse (150,150,x,y);
  x = x * 2;
  y = y / 2;
}
void mousePressed () {
  x = mouseX;
  y = mouseY;
}






