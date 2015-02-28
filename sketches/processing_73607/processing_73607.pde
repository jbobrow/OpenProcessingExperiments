
//Gregory Taxerman, Hundred Random Shapes, CP1 16-17

int num = 0;
int x = int(random(0, 301));
int y = int(random(0, 301));
int r = int(random(0, 256));
int g = int(random(0, 256));
int b = int(random(0, 256));
void setup ()
{
  size(300, 300);
  background(0);
}

void draw ()
{

  num = num + 1;

  if (num < 101)
  {
    x = int(random(0, 301));
    y = int(random(0, 301));
    r = int(random(0, 256));
    g = int(random(0, 256));
    b = int(random(0, 256));
    fill(r, g, b);     
    int z = int(random(1, 5));
    if (z == 1)
    {
      ellipse(x, y, 20, 20);
    }
    else if (z == 2)
    {
      rect(x, y, 20, 20);
    }
    else if (z == 3)
    {
      rect(y, x, 20, 50);
    }
    else if (z == 4)
    {
      ellipse(y, x, 20, 50);
    }
  }
}
