
void setup()
{
  size(600, 200);

  smooth();
}

int j=0;
int y=200;
int x=50;

void draw() {

  if (x==600)
  {
    x=50;
  }

  background(255, 0, 127);
  if (j<=height)
  {
    j=j+8;
    x=x+1;
    ellipse(x, j, 50, 50);
    if (j==height)
    {
      y=200;
    }
  }
  else
  { 
    y=y-8;
    x=x+1;
    ellipse(x, y, 50, 50);
    if (y==0)
    {
      j=0;
    }
  }
}

                
