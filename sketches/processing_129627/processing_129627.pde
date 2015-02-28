
// copyright 2014 Hyun Doug Kim
// homework #3

float x, y;
float wd, ht;
float easingCoef;

void setup()
{
  size(400, 400);
  noCursor();
  smooth();
  frameRate(10);
  easingCoef=  5;
  wd = 50;
  ht = 200;
  x= 100;
  y= 100;
}

void draw()
{
  //background (5, 186, 250);
  fill (0, 10);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);

  //circle
  fill (random(255), 0, 0);
  strokeWeight (5);
  ellipse (mouseX+wd, mouseY+ht/4, wd*.4, ht*.1);
  fill (0, random (255), 0);
  ellipse (mouseX+3*wd, mouseY+ht/2, wd*.4, ht*.1);
  fill (0, 0, random (255));
  ellipse (mouseX+4*wd, mouseY+ht/6, wd*.4, ht*.1);
  fill(255, random(255), random(255));
  ellipse (mouseX, mouseY, 10, 10);
  
}



