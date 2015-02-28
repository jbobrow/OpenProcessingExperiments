
// Min Kyung Kim, minkyunk@andrew.cmu.edu
// Homework 6
// Copyright February 2013. All rights reserved.


float cx, cy, cd, cxSpeed, cySpeed;
float bx, by, bd, bxSpeed, bySpeed;
 
PImage c;
PImage b;
 
void setup()
{
  size (400,400);
  cx = 300;
  cy = 300;
  cd = 130;
  cxSpeed= 1;
  cySpeed= 4;
   
  bx=random(width);
  by = random(height);
  bd = 100;
  bxSpeed= 4;
  bySpeed= 2;
   
  c = loadImage("car.jpg");
  b = loadImage("bomb.jpg");
   
  
}
 
 
void prepWindow()
 
{
  background (255);
  smooth();
}

void draw ()
{
 
  prepWindow ();
  movec ();
  moveb ();
   
  drawc(cx, cy, cd);
  drawb(bx, by, bd);
   
}
 
void movec ()
{
  cx = cx + cxSpeed;
 
  if (cx > width) {
    cxSpeed = -cxSpeed;
  } else if (cx < 0 ) {
    cxSpeed = - cxSpeed;
  } else if (cy > width) {
    cySpeed = -cySpeed;
  } else if (cy < 0 ) {
    cySpeed = -cySpeed;
  }
    
}
 
void drawc (float cx, float cy, float cd)
{ 
 image (c, cx, cy, cd, cd);
}
 
void moveb()
{
  bx = bx + bxSpeed;
  if (bx > width) {
    bx = -width + (bd * 2);
  }
  
  by = by + bySpeed;
  if (by > height) {
    by = -height + (bd * 2);
  }
   
}
 
 
void drawb (float bx, float by, float bd)
{
image (b, bx, by, bd, bd);
}
 
 
void keyPressed()
{
  if (key == 'c') {
    cxSpeed ++;
  } if (key == 'b') {
    bxSpeed ++;
  } if (key == 'v') {
    cxSpeed --;
  } if (key == 'n') {
    bxSpeed --;
  }
 
}



