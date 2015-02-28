
//Jenny H. CP1, mods 14-15, 3D Shapes
float r = 255;
float b = 0;
float y = 0;
float change = .25;
void setup ()
{
  size (300, 300, P3D);
}

void draw ()
{
  background (255);
  translate (150, 150, 0);
  rotateX (0);
  rotateY (y);
  y = y + 0.008;
  pointLight (r, 0, b, -200, -100, 300);
  sphere (100);
  r = r - change;
  b = b + change;
  if (r <0)
  {
    change = -.25;
  }
  if (r > 255)
  {
    change = .25;
  }
}
