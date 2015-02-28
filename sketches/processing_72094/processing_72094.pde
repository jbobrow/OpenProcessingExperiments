
int x = 200;
int y = 200;
PImage b;
void setup ()
{
  size (400, 400);
  background(127);
  b = loadImage("psy.png");
  image(b, x, y, 90, 200);
}

void draw()
{
  if (mousePressed==true)
  {
    background(127);
    image(b, x, y, 90, 200);
    x = x + int(random(-2, 2));
    y = y + int(random(-2, 2));
  }
}


