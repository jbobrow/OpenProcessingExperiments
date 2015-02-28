
//copyright J William Gott 2014


float x, y;
float wd, ht;


void setup ( ) 

{
  size (400,400);

}

void draw ( )
{
  
  fill(0, 10);
  rectMode(CORNER);
  rect( 0,0, width, height);
  x= mouseX;
  y= mouseY;
  wd= random(50);
  ht= random(50);
  
  noStroke();
 
  fill(200,0,0);
  ellipse(x,y,wd,ht);
  
}
  
