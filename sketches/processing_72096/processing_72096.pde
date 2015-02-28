
//Em F, CP1 mods 4-5, Random Walk
int x = 200;
int y = 200;
PImage b;
void setup ()
{
  size (400, 400);
  b = loadImage("http://greyskies268.webs.com/psy.png");
  background(120);
  image(b, 200, 100, 100, 200);
}

void draw()
{
  if (mousePressed==true)
  {
    background(120);
    image(b, x, y, 100, 200);
    x = x + int(random(-2, 2));
    y = y + int(random(-2, 2));
  }
}
