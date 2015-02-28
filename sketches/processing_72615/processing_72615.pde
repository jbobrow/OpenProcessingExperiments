
float x=250;
float y=250;
void setup()
{
  size(500, 500);
  smooth();
  frameRate(40);
}
void draw()
{
  noStroke();
  int a=int(random(0, 4));
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  fill(random(255),random(255),random(255));
  quad(x+10,y+10,x+10,y-10,x-10,y-10,x-10,y+10);
  if (a == 0)
  {
    x=x+20;
  }
  else if (a == 1)
  { 
    x=x-20;
  }
  else if (a == 2)
  {
    y=y+20;
  }
  else
  {
    y=y-20;
  }
  if (x<0)
  {
    x=random(500);
  }
  if (x>500)
  {
    x=random(500);
  }
  if (y<0)
  {
    y=random(500);
  }
  if (y>500)
  {
    y=random(500);
  }
}
