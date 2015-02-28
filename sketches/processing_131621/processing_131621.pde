
//HW5
//©Scott Alberstein, 2014

float x, y, dx1, wd1, ht1, a, b, wd2, ht2, dx2;
 
void setup ()
{
  size (400, 400);
  x=10;
  y=10;
  wd1=40;
  ht1=40;
  dx1=3;
 
  a=390;
  b=30;
  wd2=60;
  ht2=60;
  dx2=7;
}
 
void draw ()
{ 
  prepareWindow ();
  drawFigure ();
  moveFigure ();
}
 
void prepareWindow ()
{
  fill (0, 0, 0, 40);
  rectMode (CORNER);
  rect (0, 0, width, height);
} 
 
void figure (float x, float y, float wd1, float ht1)
{ 
  noStroke ();
  fill (255, 255, 255);
  ellipse (x, y, wd1, ht1);
} 
 
void drawFigure ()
{
  figure (x, y, wd1, ht1);
  figure (a, b, wd2, ht2);
}
 
void moveFigure ()
{ 
  x = x+dx1;
  if (x > width-20) {
    y = y+dx1;
    x = width-20;
  }
  if (y > height-20 ) {
    x = x+dx1;
    dx1 = -dx1;
    y= height-20;
  }
  if (x < 20) {
    y = y+ dx1;
    x = 20;
  }
  if (y < 20) {
    x = x+dx1;
    dx1 = -dx1;
    y=20;
  }
  
  a= a+dx2;
  if (a > width-30) {
    b = b+dx2;
    a = width-30;
  }
  if (b > height-30) {
    a = a+dx2;
    dx2 = -dx2;
    b= height-30;
  } 
  if (a < 30) {
    b = b+dx2;
    a = 30;
  }
  if (b < 30) {
    a = a+dx2;
    dx2=-dx2;
    b=30;
  }
}



