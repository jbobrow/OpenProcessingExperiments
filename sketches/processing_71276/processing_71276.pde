
// Nigel Z, Mod 14-15 CP1, colorBalls
int x, y, z;
void setup ()
{
  size (600, 600);
  x = 0;
  y = 0;
  z = 0;
}
void draw ()
{
  background (x, y, z);
  fill (255-x,255-y,255-z);
  ellipse (150,300,100,100);
  fill (x+127, y+127, z+ 127);
  ellipse (300,300,100,100);
  fill (x + 190, y + 190, z + 190);
  ellipse (450,300,100,100);
}
void keyTyped ()
{
  if (key == 'r')
  {
    x = x+255;
  }  
  if (key == 'g')
  {
    y = y+255;
  }
  if (key == 'b')
  {
    x= 0;
    y= 0;
    z= 0;
  }
  if (key == 'B')
  {
    z = z +255;
  }
  if (key == 'o')
  {
    x = x + 255;
    y = y + 165;
  }
  if (key == 'y')
  {
    x = x + 255;
    y = y + 255;
  }
  if (key == 'p')
  {
    x = x + 160;
    y = y + 32;
    z = z + 240;
  }
  if (key == 'v')
  {
    x = x + 238;
    y = y + 130;
    z = z + 238;
  }
  if (key == 'w')
  {
    x = x + 255;
    y = y + 255;
    z = z + 255;
  }
  if (x > 255)
  {
    x = x + 0;
  }
  if (y > 255)
  {
    y = Y + 0;
  }
  if (z > 255)
  {
    z = z + 0;
  }
}
void mouseMoved ()
{
  x = mouseX;
  y = mouseY;
  z = mouseX;
}
