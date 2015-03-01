
//Rosalie Sowers rsowers
//Copyright 2014

float x, y;
float dx, dy;
float wd, ht;
float sz;

PImage pic;

void setup()
{
  size(400, 400);
  smooth();
  rectMode(CENTER);
  pic = loadImage("volleyball.jpg");
  
  sz = 100;
  
  x = 0;
  dx = 2;
  y = random(height);
  dy = 2;
  
}

void draw()
{
  background(255);
  
  if (x >= width)
  {
    x = -sz;
  }
  
  if (y >= height)
  {
    y= -sz;
  }
  
  x += dx;
  y += dy;
  
  image(pic, x, y, sz, sz);
  
}
  
  
  
  


