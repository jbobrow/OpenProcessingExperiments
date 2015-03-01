
//Rosalie Sowers rsowers
//Copyright 2014

float x1, x2, y1, y2;
float dx1, dy1, dx2, dy2;
float wd, ht;
float r1, r2;
int hitCount;
boolean alreadyHit;
int fc;

PImage pic1, pic2;

void setup()
{
  size(600, 600);
  smooth();
  rectMode(CENTER);
  pic1 = loadImage("volleyball.jpg");
  pic2 = loadImage("volleyball.jpg");
  
  r1 = 50;
  r2 = 50;
  
  x1 = 0;
  dx1 = random(10, 12);
  y1 = random(height - r1);
  dy1 = random(10, 12);
  
//  x2 = width - r2 - 1;
//  dx2 = -1*random(2, 4);
//  y2 = random(height - r2);
//  dy2 = random(2, 4);
  
  hitCount = 0;
  alreadyHit = false;
  fc = 0;
  
  textSize(20);
  
}

void draw()
{
  background(0);
  
   if ((dist(x1, y1, x2, y2) <= (.5*(r1 +r2))) && alreadyHit == false)
  {
    fill(0, 255, 0);
    rect(width *.5, height *.5, width, height);
    dx1 = -dx1;
    dy1 = -dy1;
    dx2 = -dx2;
    dy2 = -dy2;
    
    hitCount++;
    alreadyHit = true;
    fc = frameCount;
  }
  
  if (fc == 0){}
  else if (frameCount >= fc + 10)
  {
    alreadyHit = false;
  }
  
  if (x1 >= (width - r1) || x1 < 0)
  {
    dx1 = -dx1;
    x1 += dx1;
  }
  
  if (y1 >= (height - r1) || y1 < 0)
  {
    dy1 = -dy1;
    y1 += dy1;
  }
  
  if (x2 >= (width) && dx2 > 0)
  {
    x2 = -r2;
  }
  
  if (x2 <= -r2 && dx2 < 0)
  {
    x2 = width;
  }
  
   if (y2 >= (height - r2) && dy2 > 0)
  {
    y2 = -r2;
  }
  
  if (y2 <= -r2 && dy2 < 0)
  {
    y2 = height;
  }  
 
  if (keyPressed == true && keyCode == UP)
  {}
  else
  {
    x1 += dx1;
    y1 += dy1;
    x2 += dx2;
    y2 += dy2;
  }
   
  image(pic1, x1, y1, r1, r1);
  
  x2 = mouseX;
  y2 = mouseY;
  image(pic2, x2, y2, r2, r2);

  
  fill(255, 0, 0);
  text(hitCount, width - 50, height - 20);
  
}
  
  
  
  


