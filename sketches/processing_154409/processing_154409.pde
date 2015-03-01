
float x, y, c;
void setup()
{
  
  size(400,400);
   x=200;
  y=200;
  c=.1;
  smooth();
  fill(200, 0, 0);
 
 
  
  

}
void draw()
{
   background(255);
  float dx=mouseX-x;
  float dy=mouseY-y;
  x=x+dx*c;
  y=y+dy*c;
  fill(0);
  ellipse(x, y, 100, 100);

}



