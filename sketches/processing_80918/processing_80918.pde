
PImage lena;
int x, y;
void setup ()
{
  background (0);
  size (400,400);
  x = -400;
  y = -400;
  lena = loadImage ("Lenna.JPG");
}
void draw ()
{
  image (lena, x, y);
  if (x <= 0)
  {
    x++;
    y++;
  }
}

