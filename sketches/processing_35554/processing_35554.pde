
void setup() {
  size (300, 300);
  smooth ();
  background (HSB,0,0,0);
  noStroke();
  ellipseMode (CENTER);
  ellipse (100, 150, 50, 50);
  ellipse (200, 150, 50, 50);
}

int x = 0;
int y = 0;
int z = 100;
void draw() {
  colorMode (HSB);
  fill(HSB,y,200,100);
  ellipse (0,0,x,y);
  ellipse (0,300,x,y);
  ellipse (300,300,x,y);
  ellipse (300,0,x,y);
  rectMode(CENTER);
  rect (150,150,x,x);
  x++;
  y--;
  z--;
}
void mouseDragged () {
  x = mouseX;
  y = mouseY;
}






