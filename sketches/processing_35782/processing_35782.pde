
float diameter;
float space = 30;

void setup()
{
  size(700,400);
  smooth();
  noStroke();
}

void draw()
{
  translate(space/2,space/2);
  background(0);
  
  for (float x = 0; x < 100; x = x + 1)
  {
    for (float y = 0; y < 100; y = y + 1)
    {
      diameter = dist(x * space, y * space, mouseX, mouseY) / 10;
      ellipse(x * space, y * space, diameter, diameter);
    }
  }
}

