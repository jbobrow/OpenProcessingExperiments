
float x=0, y=0, r=0, theta=3.1415927;
float x1=250,y1=250;
 
void setup()
{
  size(500,500);
  rectMode(CORNERS);
}
 
void draw()
{
  background(255);
  strokeWeight(5);
  smooth();
  if(mousePressed)
  {
  for(int i = 0; i < 60; i++)
  {
    x=mouseX-(r*cos(theta*i+theta));
    y=mouseY-(r*sin(theta*i+theta));
    stroke(0,0,random(255));
    line(mouseX,mouseY,x,y);
    x1=abs(250-mouseX);
    y1=abs(250-mouseY);
    r=random(30)+sqrt((x1*x1)+(y1*y1));
    theta=theta+(10);
  }
  fill(255);  
  }
}

