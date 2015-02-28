
//Tina L., CP1 14/15 DoublingShapes
int x = 1;
void setup()
{
  size(300, 300);
  frameRate(1);
}
void draw()
{
  background(0);
  for (int y=1; y<=x; y++)
  {
    fill(random(0, 256), random(0, 256), random(0, 256));
    ellipse(random(300), random(300), 15, 15);
    if (x>1000)
    {
      x=1;
      y=1;
    }
  }
  x=x*2;
}
