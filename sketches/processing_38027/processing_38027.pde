
void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  background(0);
}

void draw()
{
  for (int x=100; x<width;x+=100)
  {
    for (int y=100;y<height;y+=100)
    {
      fill(255, 0, 0);
      ellipse(x, y, 80, 80);
      fill(255);
      ellipse(x, y, 70, 70);
      fill(255, 0, 0);
      ellipse(x, y, 60, 60);
      fill(255);
      ellipse(x, y, 50, 50);
      fill(255, 0, 0);
      ellipse(x, y, 40, 40);
      fill(255);
      ellipse(x, y, 30, 30);
      fill(255, 0, 0);
      ellipse(x, y, 20, 20);
      fill(255);
      ellipse(x, y, 10, 10);
    }
  }
}

