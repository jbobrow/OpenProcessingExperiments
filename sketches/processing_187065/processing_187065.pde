
void setup()
{
  size (500,500);
}

void draw()
{
  for (int x=0; x<width; x=x+50)
  {
    for (int y=0; y<height; y=y+50)
    {
      frameRate(1);
      fill(random(0,255), random(0,255), random(0,255));
      rect (x, x+10, 100, 100);
    }
  }
}
