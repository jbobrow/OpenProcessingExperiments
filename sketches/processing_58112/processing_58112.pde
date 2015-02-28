
//ripped off claire gustavson, for test purposes, Section A, 2012 copywrite
 
float a, b, side;
 
void setup() {
  size (600, 300);
  background (200);
  a = 0;
  b = 0;
  side=20;
  frameRate (15);
}
 
void draw() {
  noStroke ();
  fill (200, 15);
  rect (0, 0, 600, 300);
  fill (random(b/2), random(200), b);
  rect (a, mouseY, side, side);
   
   
   
  if ( a < width)
  {
     a = a+3;
  } else {
    background(200);
     a = -side;
  }
 
 
 
}
 
void mouseClicked() {
  if(b == 0) {
    b = 255;
  } else {
    b = 0;
  }
}
