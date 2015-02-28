
//Alex Lim, CP1 mods 4/5, Ticklish Penguin
//www.dizbalex.webs.com 
PImage a;
int x = 250;
int y = 250;
void setup ()
{ 
  size (500, 500);
  frameRate (10);
  a = loadImage ("http://media.tumblr.com/tumblr_m8p8e4MZ7E1rn549c.png");
}
void draw ()
{
  background (random (155), random (255), random (155));
  image (a, x, y, 150, 150);
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
