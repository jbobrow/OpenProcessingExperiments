
int coordinateValue;
int colorValue;

void setup()
{
  size(400,400);
  coordinateValue = 0;
  strokeWeight(25);
  frameRate(10);
  colorValue = 100;
  colorMode(HSB, 100, 100, 100);
  stroke(0);
  background(0);
}

void draw()
{
  color sColor = color(colorValue, 100, 100);
  stroke(sColor);
  point(coordinateValue, coordinateValue);
  coordinateValue = coordinateValue + 25;
  colorValue = colorValue - 10;
  if (coordinateValue > 400)
  {
       coordinateValue = 0;
       colorValue = 100;
       background(0);
  }
}

