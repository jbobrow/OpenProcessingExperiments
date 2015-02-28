

int xValue;
int yValue;

void setup()
{
  size(400,400);
  xValue = 0;
  strokeWeight(25);
  frameRate(4);
  stroke(0);
}

void draw()
{
  background(255);
  yValue = xValue;
  point(xValue,yValue);
  xValue = xValue + 25;
  stroke(xValue/400.0*255);
  if (xValue > 400)
  {
    xValue = 0;
  }
}

