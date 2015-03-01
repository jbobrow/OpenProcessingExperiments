
//Chris Edgett 
//Copyright


float x, y, wd, ht;

void setup( )
{
  size (400, 400);
 x=200;
 y=200;
 wd=100;
 ht=100;
}

void draw( )
{
  x=mouseX;
  y=mouseY;
  background(0); 
  triangle(x,y-175,x-100,y+75,x+100,y+75);
  rectMode(CENTER); 
  fill(230, 60, 0);
  rect(x, y, wd, ht);
  fill(204, 100, 0);
  ellipse(x, y, wd, ht);
  fill(240, 239, 0);
  ellipse(x+.25, y+.25, wd-.25, ht-.25);
  fill(204, 100, 0);
  stroke(204, 100, 0);
  line (x, y, 200, 150);
  
  
 
  line (x, y, 300, 275);
  
  line (x, y, 100, 275);
}








