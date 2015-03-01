
//Claire Sheen (csheen)
//Copyright 7.3.14

float wd, ht, x, y, dx, dy, easingCoefficient;

PImage pic;

void setup()
{
  size (700, 700);
  frameRate(60);
  smooth();
  noStroke();
  easingCoefficient = 0.1;
  ht = 50;
  wd = 100;
  x = 400;
  y = 200;
  dx = 4;
  dy = 1;
  imageMode( CENTER );
  pic = loadImage("transparentcroissant.png");
}

void draw()
{
  background(0);//black background 
  x = x + dx;//horizontal motion and speed
  y = y + dy;//vertical motion and speed
  
 image(pic, x, y, wd, ht);
 
 if(x < 0 || x > 700)//if it hits the left or right wall
  {
    dx = -dx;//reverse horizontal speed
    x = x + dx;//restore motion so it doesn't shake
  }
  
 if(y < 0 || y > 700)//if it hits the top or bottom wall
 {
    dy = -dy;//reverse vertical speed
    y = y + dy;//restore motion so it doesn't shake
 }
  
}




