
void setup()
{
  size(480,480);
  smooth();
  fill(120,mouseX,mouseY);
}
float x=mouseX;
  float y=mouseY;
void draw()
{
  
  int targetX=mouseX;
  int targetY=mouseY;
  float d=dist(mouseX,mouseY,pmouseX,pmouseY);
  fill(mouseX,mouseY,d);
  x +=(targetX-x)*.1;
  y +=(targetY-y)*.1;
  ellipse(x,y,30,30);
}


