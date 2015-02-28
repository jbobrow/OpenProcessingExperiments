
void setup()
{
  size(360,500);
}

void draw()
{
}

void keyPressed()
{
  fill(0,0,0);
  rect(0,0,360,500);
  for(int x = 0; x < 360; x++)
  {
    for(int y = 0; y < 500; y++)
    {
      // stroke(255, 0, 0);
      stroke(sin(float(x)/360)*255, cos(float(y)/360)*255, 0);
      point(x,y);
    }
  }
}
