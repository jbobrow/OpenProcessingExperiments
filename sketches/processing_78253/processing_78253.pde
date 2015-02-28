
//Alex Lim, CP1 mods 4/5
//www.dizbalex.webs.com
int d = 1;
int z = 1;
float a = 0;
float b = 0;
float c = 0;
void setup()
{
  size (500, 500);
  background (156, 245, 173);
  frameRate (0.5);
  textAlign (0, 0);
  textSize (20);
}
void draw()
{
  while (d <= z)
  {
    a = random (0, 50);
    b = random (255);
    c = random (150);
    fill (a, b, c, 100);
    ellipse (random (501), random (501), random (75), random (100));
    d++;
  }
    fill (0);
    text(z, 50, 50);
    if (z < 65536)
    {
      z*=2;
    }
    else
    {
      z = 1;
    }
}
