
//Hundred Random Circles ,Aidan F, Computer Programing 1, Mr. Simon

int r = 0;
int g = 0;
int gchange = 1;
int b = 0;

void setup()
{
  size(500, 500);
  frameRate(10);
}
void draw()
{  
  background(0);
  int i = 1;
  while (i<=100)
  {
    ellipse(int(random(500)), int(random(500)), 30, 30);
    i++;
    fill(r, g, b);
    g = g + gchange;
    if (g > 255)
    {
      gchange = -1;
    }
    if (g < 0)
    { 
      gchange = 1;
    }
  }
}
