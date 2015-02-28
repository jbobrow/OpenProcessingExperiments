
// Alex Lim, CP1 mods 4/5, A Hundred Random Shapes
//www.dizbalex.webs.com
int d = 1;
float a = 0;
float b = 0;
float c = 0;
void setup()
{
  size (500, 500);
  background (0);
  frameRate (20);
}
void draw()
{
  while (d<=100)
  {
    a = random (0, 50);
    b = random (255);
    c = random (150);
    fill (a, b, c, 100);
    ellipse (random (501), random (501), random (75), random (100));
    d++;
  }
}
void mousePressed()
{
  d = 1;
  background (random(255));
  ellipse (random(255), random(255), random(255), random(255));
}
