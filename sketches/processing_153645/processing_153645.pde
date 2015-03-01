
//jack lance jlance
//copyright
float ec=.06;
void setup()
{
  size(400,400);
  rectMode(CENTER);
  background(255,255);
}
float h=40;
float w=40;
float x=200;
float y=200;
void draw()
{
  fill(255,10);
  rect(width/2,height/2,width,height);
  float xi = (mouseX-x)*ec;
  float yi = (mouseY-y)*ec;
  x+=xi;
  y+=yi;
  fill(0);
  ellipse(x,y,h,w);
}
  


