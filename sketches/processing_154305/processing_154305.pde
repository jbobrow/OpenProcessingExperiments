
//Claire Sheen (csheen)
//Copyright 7.3.14

float wd, ht, x, y, easingCoefficient;

PImage pic;

void setup()
{
  size (400, 400);
  frameRate(60);
  smooth();
  noStroke();
  easingCoefficient = 0.1;
  wd = ht = 200;
  x = 400;
  y = 200;
  
  imageMode( CENTER );
  pic = loadImage("chicken.png");
}

void draw()
{
  fill(0, 10);
  rect(0, 0, width, height);//transparent traces
  
  x = x - 4;
  y = y - 1;
  
 image(pic, x, y, wd, ht);
 
 if(x < 0)
  {
    x = width;
  }
  
  if(y < 0)
  {
    y = height;
  }
}




