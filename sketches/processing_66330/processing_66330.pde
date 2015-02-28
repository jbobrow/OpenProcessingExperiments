

float bx=15, by=250;
float fx=10, fy=20;
float ball=30;
float g=5;
float f=0.75;

void setup() {
  size(500, 500);
  fill(0);
  noStroke();
  smooth();
  frameRate(25); 
  }
 
void draw() {
  background(255);
  ellipse(bx, by, ball, ball);
  if (bx>490) {
    bx=510;
  }
  if (by>490) {
    fy=-fy*f;
  } 
  else {
    fy=fy+g;
  }
  bx=bx+fx;
  by=by+fy;
  } 

