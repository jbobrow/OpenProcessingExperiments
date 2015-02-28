
//stephanie Jeong yujeongj copyright 2014
float x, y;
float wd,ht;


void setup()
{
  size(400,400);
}  
 
 
 void draw()
{ 
  //background(0);
  fill(0,0);
  rectMode(CORNER);
  rect(0,0,width,height);
  x=mouseX;
  y=mouseY;
  wd=100;
  ht=100;

fill(200,0,0);
ellipse(x,y,50,50);
}


