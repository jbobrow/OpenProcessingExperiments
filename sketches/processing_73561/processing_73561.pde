
float x = 0;
float y = 0;
int r = 255;
int g = 0;
int b = 0;
void setup()
{
  size(400, 400, P3D);
  background(0);
}
void draw()
{
  if (keyPressed)
  {
    if (key=='r')
    {
      reset();
    }
  }
  changingColor();
  rotatingCube();
}
void rotatingCube()
{
  noStroke();
  lights();
  translate(mouseX, mouseY, 0);
  rotateX(0+x);
  rotateY(0-y);
  x = x + .1;
  y = y + .1;
  box(50);
  if (mousePressed)
  {
    if (mouseButton==LEFT)
    { 
      x = x + 1;
      y = y + 1;
    }
    if (mouseButton==RIGHT)
    {
      x = x - .1;
      y = y + .1;
    }
  }
}
void reset()
{
  background(0);
}
void changingColor()
{
  fill(r, g, b, 127);

  if (b ==0 && g <255)
  {
    g = g + 1;
  }
  if (g==255)
  {
    r = r - 1;
  }
  if (r<=0 && g ==255)
  {
    r = 0;
    b = b + 1;
  }
  if (b==255)
  {
    g = g - 1;
  }
  if (r<255&&g<=0)
  {
    g = 0;
    r = r + 1;
  }
  if (r==255&&g == 0)
  {
    b = b - 1;
  }
}
