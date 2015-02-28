
int r = 0;
  int g = 0;
  int b = 0;

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
    for (int x = 0; x < width; x = x + 1)
  {
    keywork(x/2*mouseX, x/2*mouseY, 0, 0, 0);
  }
  for (int x = 0; x < width; x = x + 100)
  {
    keywork(2*x, 2*x, 255, 255, 255);
    for (int y = 0; y < width; y = y + 100)
    {
      keywork(mouseX, mouseY, mouseX, y/2, mouseY);
    }
  }
}


void keywork(int x, int y, int r, int g, int b)
{
  noFill();
  strokeWeight(3);
  stroke(r, g, b);
  ellipse(x, y, 10, 10);
  triangle(x, y-20, x-20, y+13, x+20, y+13);
  ellipse(x, y+25, 10, 10);
  ellipse(x-20, y-13, 10, 10);
  ellipse(x+20, y-13, 10, 10);
  ellipse(x, y-30, 35, 35);
  ellipse(x-22, y+13, 35, 35);
  ellipse(x+22, y+13, 35, 35);
}
