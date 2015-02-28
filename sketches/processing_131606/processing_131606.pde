
//copyright Mina Kim 2014
//minakim0128@gmail.com

float x, y, dx1, wd1, ht1;
float a, b, wd2, ht2, dx2;


void setup ()
{
  size (400, 400);
  x=10;
  y=10;
  wd1=20;
  ht1=20;
  dx1=5;

  a=390;
  b=30;
  wd2=30;
  ht2=30;
  dx2=10;
  
  
}

void draw ()
{

  prepWindow ();
  drawFigures ();
  moveFigures ();
}

void prepWindow ()
{
  fill (140, 210, 200, 40);
  rectMode (CENTER);
  rect (200, 200, width, height);
}


void figure (float x, float y, float wd1, float ht1)
{

  fill (230, 120, 30);
  noStroke ();
  ellipse (x, y, wd1, ht1);
}



void drawFigures ()
{

  figure (x, y, wd1, ht1);
  figure (a, b, wd2, ht2);
}

void moveFigures ()
{

  x = x+dx1;
  if (x > width-10) {
    y = y+dx1; 
    x = width-10;
  }
  if (y > height-10 ) {
    x = x+dx1; 
    dx1 = -dx1; 
    y= height-10;
  }
  if (x < 10) {
    y = y+ dx1; 
    x = 10;
  }
  if (y < 10) {
    x = x+dx1; 
    dx1 = -dx1; 
    y=10;
  }


  a= a+dx2;
  if (a > width-12) {
    b = b+dx2; 
    a = width-12;
  }
  if (b > height-12) {
    a = a+dx2; 
    dx2 = -dx2; 
    b= height-12;
  } //*2 to -dx2
  if (a < 12) {
    b = b+dx2; 
    a = 12;
  }
  if (b < 12) {
    a = a+dx2; 
    dx2=-dx2; 
    b=12;
  }
}




