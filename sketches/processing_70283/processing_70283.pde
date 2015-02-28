
//Alex L., Penguin, CP1, Mods 4-5
//http://dizbalex.webs.com
int x=0;
int w=0;
int y=0;
int xChange = 1;
int yChange = 1;
void setup ()
{
  size (500, 500);
  stroke (0, 0, 0);
  background (0, 0, 0);
  smooth ();
  frameRate (50);
}
void draw ()
{
  wheeWhoo ();
  fill(random(255), 100, 255, 50);
  ellipse (x, y, 100, 100);
  ellipse (500-x, 500-y, 100, 100);
  ellipse (x, 250, 100, 100);
  ellipse (500-x, 250, 100, 100);
  ellipse (x, 500-y, 100, 100);
  ellipse (500-x, y, 100, 100);
  ellipse (250, y, 100, 100);
  ellipse (250, 500-y, 100, 100);
  x = x + xChange;
  y = y + yChange;
  if (x < 250)
  {
    xChange = xChange + 1;
  }
  if (x >= 250)
  {
    xChange = xChange - 1;
  }
  if (y < 250)
  {
    yChange = yChange + 1;
  }
  if (y >= 250)
  {
    yChange = yChange - 1;
  }
}
void wheeWhoo ()
{
  fill(random(100), 100, 105, 50);
  ellipse (250, 250, x, y);
  x = x + xChange;
  y = y + yChange;
  if (x < 250)
  {
    xChange = xChange + 1;
  }
  if (x >= 250)
  {
    xChange = xChange - 1;
  }
  if (y < 250)
  {
    yChange = yChange + 1;
  }
  if (y >= 250)
  {
    yChange = yChange - 1;
  }
}
