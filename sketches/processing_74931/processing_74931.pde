
//Victor Murillo, CP1 mods 16-17, Ticklish Penguin 
int x = 250;
int y = 200;
void setup()
{
  size(500, 400);
  smooth();
  frameRate(30);
}
void draw()
{
  background(0, 0, 0);
  fill(255, 0, 0);
  ellipse(x, y, 40, 40);
  int direction = int(random(0, 4));
  if (mousePressed == true)
  {
    if (direction == 0)
    {
      x = x + 10;
    }
    else if (direction == 1)
    {
      x = x - 10;
    }
    if (direction == 2)
    {
      y = y + 10;
    }
    else if (direction == 3)
    {
      y = y - 10;
    }
    else
    {
      y = y + 10;
    }
    if (x > 500)
    {
      background(0);
      x = 250;
    }
    if ( y > 400)
    {
      y = 200;
    }
  }
}
