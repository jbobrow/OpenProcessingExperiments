
int x=1;
int y=1;
void setup()
{
  size(600, 600);
  frameRate(1);
  background(0);
}
void draw()
{
  if (y<1024)
  {
    while (x<=y)
    {
      ellipse(random(600), random(600), 10, 10);
      x++;
    }
  }
  y=y*2;
}

void mousePressed()
{
  background(0);
  x=1;
  y=1;
}
