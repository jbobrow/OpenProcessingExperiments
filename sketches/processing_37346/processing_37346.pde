
//Homework 5
//Christina Lee copyright September 2011 Pittsburgh, PA 15289
int x = 0; // horizontal position of the ellipses
int y = 0; // vertical position of the ellipses
int r = y/30; // size of the ellipses
int c = y/2; // value of "B" (RGB)

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  frameRate(20);
}

void draw() {
  fill(0);
  rect(0, 0, 400, 400);
  x=0;
  y=0;
  r=y/30;
  c=y/2;
  while (x <= width)
  { 
    y=0;
    while (y <= height)
    { 
      y = y+25;
      c = y/2; 
      r = y/20;
      fill(255, 0, c);
      ellipse (x, y, r, r);
    }
    x = x+25;
    
  }
}

