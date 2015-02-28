
//Aaron L., CP1, Mods 4-5, Ticklish Penguin
PImage a;
int x = 250;
int y = 250;
void setup()
{
  size(500,500);
  a = loadImage("http://ak.picdn.net/shutterstock/videos/587158/preview/stock-footage-helicopter-animation-loop.jpg");
}
void draw()
{
  background (255);
  image(a, x, y, 150, 150);
  int direction = int(random(0, 20));
  if(direction == 0)
  {
    x = x + 20;
  }
  if (direction == 1)
  {
      x = x - 20;
  }
  if (direction == 2)
  {
      y = y + 20;
  }
  if (direction == 3)
  {
      y = y - 20;
  }
}
