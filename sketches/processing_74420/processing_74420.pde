
//William T., One Hundred Random Shapes, CP1 mods 14-15
PImage waterm;
PImage pat;
int x = 1;

void setup()
{
  size(600, 600);
  frameRate(1);
  waterm = loadImage("http://azsanggetsu.webs.com/watermelon.png");
  pat = loadImage("http://azsanggetsu.webs.com/watermelon patch.jpg");
}
void draw()
{
  image(pat,0,0,600,600);
  while (x <= 100)
  {
    image(waterm, random(-11, 611), random(-11, 611), 50, 50);
    x++;
  }
  if ( x >= 100)
  {
    x = 1;
  }
}
