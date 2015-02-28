
void setup()
{
  size(700, 400);
  smooth();
}
 
void draw()
{
  background(96);
  stroke(0);
  for (int y = 0; y < height; y = y + mouseX + 1)
  {
    line(0, y, width-1, y);
  }
  for (int x = 0; x < width; x = x + mouseX + 1)
  {
    line(x, 0, x, height-1);
  }
}

