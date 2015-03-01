
//Rosalie Sowers rsowers
//Copyright 2014

float x1, x2, y1, y2;
float dx1, dy1, dx2, dy2;
float wd, ht;
float r1, r2;

PImage pic1, pic2;

void setup()
{
  size(400, 400);
  smooth();
  rectMode(CENTER);
  pic1 = loadImage("volleyball.jpg");
  pic2 = loadImage("volleyball.jpg");
  
  r1 = 50;
  r2 = 50;
  
  x1 = 0;
  dx1 = random(4, 6);
  y1 = random(height - r1);
  dy1 = random(4, 6);
  
  x2 = width - r2 - 1;
  dx2 = -1*random(4, 6);
  y2 = random(height - r2);
  dy2 = random(4, 6);
  
}

void draw()
{
  background(255);
  
  
  
  if (x1 >= (width - r1) || x1 < 0)
  {
    dx1 = -dx1;
  }
  
  if (y1 >= (height - r1) || y1 < 0)
  {
    dy1 = -dy1;
  }
  
  if (x2 >= (width - r2) || x2 < 0)
  {
    dx2 = -dx2;
  }
  
  if (y2 >= (height - r2) || y2 < 0)
  {
    dy2 = -dy2;
  }
  
  if (dist(x1, y1, x2, y2) <= (.5*(r1 +r2)))
  {
    dx1 = -dx1;
    dy1 = -dy1;
    dx2 = -dx2;
    dy2 = -dy2;
  }
  
  x1 += dx1;
  y1 += dy1;
  x2 += dx2;
  y2 += dy2;
  
  image(pic1, x1, y1, r1, r1);
  image(pic2, x2, y2, r2, r2);
  
}
  
  
  
  


