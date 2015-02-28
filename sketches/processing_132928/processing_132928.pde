
// homework 3
// copyright Josh Kim gyeongyk

//variables
float x, y;
float w, h;
float xDist, yDist;
float easingCoef;
{
   x=100;
   y=300;
   w=50;
   h=50;
}

void setup()
{
  size(400, 400);
  noCursor();
  frameRate(30);
  background(0);
  easingCoef=0.3;
  smooth();
}

void draw()
{
  x=mouseX;
  y=mouseY;
  fill(0, 30);
  rect(0, 0, width, height);
  
  noStroke();
  fill(255, random(0, 255), 0);
  triangle(0, 0, x-10, y-10, x+10, y+10);
  triangle(width, 0, x+10, y-10, x-10, y+10);
  triangle(0, height, x-10, y+10, x+10, y-10);
  triangle(width, height, x+10, y+10, x-10, y-10);
  triangle(width*0.5, 0, x+5, y+5, x-5, y+5);
  triangle(0, height*0.5, x-5, y+5, x+5, y-5);
  triangle(width, height*0.5, x+5, y+5, x-5, y-5);
  triangle(width*0.5, height, x-5, y-5, x+5, y+5);
  
  fill(255);
  noStroke();
  ellipse(x, y, w, h);
}


