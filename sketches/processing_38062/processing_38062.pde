
void setup()
{
  background(0, 0, 0);
  size(500, 500);
  smooth();
  noStroke();
}

void draw()
{
  for(int x = 100; x<=400; x+=100)
  {
    for(int y = 100; y<=400; y+=100)
    {
      for(int r = 80; r>=8; r-=8)
      {
        if((r/8)%2 == 0)
        {
          fill(225, 0, 0);
          ellipse(x, y, r, r);
        }
        else
        {
          fill(255,255,255);
          ellipse(x, y, r, r);
        }
      }  
    }
  }
}
