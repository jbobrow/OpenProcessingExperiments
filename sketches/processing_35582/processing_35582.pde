
void setup() {
  size (300, 300);
  smooth ();
  background (0,0,0);
  noStroke();
  ellipseMode (CENTER);
  // Two beginning circles  
  ellipse (100, 150, 50, 50);
  ellipse (200, 150, 50, 50);
}

int x = 0;
int y = 0;

void draw() {
  colorMode (HSB);
  fill(y,x,width);
 //Tree circles with x,y 
  ellipse (100, 150, x, y);
  ellipse (200, 150, x, y);
  ellipse (150,150,x,y);
 // thses make curved lines starting from the three circles as the central points
  x = x * 2; 
  y = y / 2;
}
void mousePressed () {
  // Colors and objects are linked to x,y coordinates of mouse.  
  x = mouseX;
  y = mouseY;
}






