
//Justin L., TicklishThing CP1 Mods 16/17

PImage b;
int x = 250;
int y = 150;
void setup()
{
  background(85, 89, 255);
  size(800, 600);
  b = loadImage("http://media.comicvine.com/uploads/10/100144/2506710-tumblr_lxpxkmgtq81qko4x4o1_500.gif");
}

void draw()
{
  if (mousePressed == true)
  {
    image(b, x, y, 150, 150);
    x = x + int(random(-5,5));
    y = y + int(random(-5,5));
  }
}
