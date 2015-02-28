
//homework 5
//Hyun Doug Kim copyright 2014 hyundouk    

float x, y, wd, ht, dx, dy;
float tx, ty, twd, tht, tdx, tdy;
float bgColor, figColor;

void setup()
{
  size (400, 400);
  background (0);
  x= 50 ;
  y= 50;
  wd= 50;
  ht= 50;
  dx= 4;
  dy=0;
  
  tx= 100;
  ty= 100;
  twd= 100;
  tht= 100;
  tdx= 3;
  tdy=0;
 
bgColor = color (255, 0, 0);
figColor = color (255);
noStroke ();
}

void draw()
{
  prepWindow();
  drawFigures();
  moveFigures();
}

void prepWindow ()
{ 
  fill(0, 10);
  rect(0, 0, width, height);
}

void figure (float x, float y, float wd, float ht)
{
  ellipse(x, y, wd, ht);
}

void drawFigures()
{
  fill(255);
  noStroke();
  figure(x, y, wd, ht);
  figure(tx, ty, twd, tht);
}

////////////////////////////////////// rect move around

void moveFigures()
{
  x+=dx;
  y+=dy;
  
  if (x>width-50)
  {
  dx=0;
  dy=1;
  }
  y+=dy;
  x+=dx;
  if (y>height-50)
  {
  dy=0;
  dx=-1;
  }
  x+=dx;
  y+=dy;
  if (x<0+50)
  {
  dx=0;
  dy=-1;
  }
  y+=dy;
  x+=dx;
  if (y<0+50)
  {
  dy=0;
  dx=1;
  }
 
  ///////////////////////////////// ellipse move around 
  
  tx+=tdx;
  ty+=tdy;
  if (tx>width-100)
  {
  tdx=0;
  tdy=1;
  }
  ty+=tdy;
  tx+=tdx;
  if (ty>height-100)
  {
  tdy=0;
  tdx=-1;
  }
  tx+=tdx;
  ty+=tdy;
  if (tx<0+100)
  {
  tdx=0;
  tdy=-1;
  }
  ty+=tdy;
  tx+=tdx;
  if (ty<0+100)
  {
  tdy=0;
  tdx=1;
  }
}


