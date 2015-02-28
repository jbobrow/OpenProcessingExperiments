
//Doubling Shapes, Aidan F, Computer Programing 1, Mr. Simon

int r = 0;
int g = 0;
int gchange = 1;
int b = 0;
int d = 1;

void setup()
{
  size(500, 500);
  frameRate(3);
}
void draw()
{  
  background(0);
  int i = 1;
  while (i<=d)
  {
    ellipse(int(random(500)), int(random(500)), 30, 30);
    i++;
    fill(r, g, b);
    g = g + gchange;
    if (d == 1024)
    {
      d = 1;
      background(0);
    }
    if (g > 255)
    {
      gchange = -1;
    }
    if (g < 0)
    { 
      gchange = 1;
    }
  }
  d = (d* 2);
}
