
void setup()
{
  size(600, 600);
  background(255);
  frameRate(60);
}
int x=int(random(0, 601));
int y=int(random(0, 601));
void draw()
{
  int a=int(random(0, 2));
  int b=int(random(0, 2));
  fill(random(255), random(255), random(255));
  ellipse(x, y, 20, 20);
  if (a==0)
  {
    x=x-10;
  }
  if (a==1)
  {
    x=x+10;
  }
  if (b==0)
  {
    y=y-10;
  }
  if (b==1)
  {
    y=y+10;
  }
  if (x>601)
  {
    x=int(random(0, 601));
  }
  if (x<0)
  {
    x=int(random(0, 601));
  }
  if (y>601)
  {
    y=int(random(0, 601));
  }
  if (y<0)
  {
    y=int(random(0, 601));
  }
}
