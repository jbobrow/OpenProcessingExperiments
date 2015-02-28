
// © Laura Tjho Jan 24 2013
// 60-357 Hw Assignment 3

float x, y, wd, ht;

void setup ()
{
  size(400,400);
  x=1;
  y= height*.5;
  wd= width* .25;
  ht= height*.25;
  
  frameRate(15);
  smooth();
  background(240, 143, 143);
}

void draw()
{
  float x= mouseX;
  float y= mouseY;
  
  stroke(255);
  fill(255, 20);
  strokeWeight(.5);
  ellipse(x, y, wd*.75, ht*.75);
  
  ellipse(mouseX, mouseY, (mouseX-pmouseY), (mouseY-pmouseY) );
  
  float distX = mouseX-x;
  float distY = mouseY-y;
  
  fill(46, 211, 255, 40);
  ellipse(x, y, wd*.2, ht*.2);
  ellipse(mouseX-(x*.25), mouseY-(y*.25), (mouseX-pmouseY), (mouseY-pmouseY));
}

