
// Homework 5, September 2011
// Copyright Manuela Kind, CMU Pittsburgh PA
//----------------------------------------------

//-------------variables---------------

int y;
int x;
int h;
int w;
color pink;
color gruen;
color blau;
float col;

//-------------setup-------------------

void setup ()
{
  //variables
  x   =  25;
  y   =  25;
  h   =  15;
  w   =  15;
  
  pink  = color (255, 200, 200);
  gruen = color (200, 255, 200);
  blau  = color (200, 200, 255);
  col   = color (random(200), random(200), random(200));

  //general
  size (400, 400);
  background (100, 200, 100);
  stroke (255);
  smooth();
}

//-------------draw-------------------

void draw ()
{
  ellipseMode(CENTER);
  background (100, 200, 100);
  x = 25; y = 25;       
  while (x < 400)
  {

//circles
    fill (gruen);
    ellipse (x, y, h, w);
    x = x + 25;
    y = y + 25;

    fill (pink);
    ellipse (x-25, y, h, w);
    x = x + 25;
    y = y + 25;

    fill (blau);
    ellipse (x+25, y, h, w);
    x = x + 25;
    y = y + 25;
    }
 
}

//---------random color----------------


void keyPressed()
  {
    
   x   =  25;
   y   =  25;
   while (x < 400)
  { 
    col   = color (random(256), random(256), random(256));
    fill (col);
    ellipse (x, y, h, w);
    x = x + 25;
    y = y + 25;

    fill (col);
    ellipse (x-25, y, h, w);
    x = x + 25;
    y = y + 25;

    fill (col);
    ellipse (x+25, y, h, w);
    x = x + 25;
    y = y + 25;
    }
  

}

  

