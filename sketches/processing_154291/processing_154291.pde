
//Claire Sheen (csheen)
//Copyright 7.3.14

float wd, ht, x, y;

void setup()
{
  size (400, 400);
  frameRate(60);
  smooth();
  noStroke();
}

void draw()
{
  background(0);
  x = mouseX;
  y = mouseY;
  wd = 200;
  ht = 200;
  fill(194, 105, 245);//violet
  ellipse(x, y, wd, ht);
  
  fill(99, 255, 239);//blue
  ellipse(x, y, wd-30, ht-30);
  
  fill(162, 255, 99);//green
  ellipse(x, y, wd-60, ht-60);
  
  fill(255, 252, 99);//yellow
  ellipse(x, y, wd-90, ht-90);
  
  fill(255, 154, 99);//orange
  ellipse(x, y, wd-120, ht-120);
  
  fill(255, 119, 119);//red
  ellipse(x, y, wd-150, ht-150);
}


