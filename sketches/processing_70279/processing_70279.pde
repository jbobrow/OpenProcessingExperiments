
//Aaron L., Animation, CP1, Mods 4-5
int x = 0;
int y = 0;
int xChange = 5;
void setup()
{
  size(500, 500);
  background(255);
  noFill();
  stroke(193, 205, 193);
}
void draw()
{
  ellipse(250, 250, x, y);
  x = x + xChange;
  y = y + 1; 
  if (x < 250)
    xChange = xChange + 1; 
  if (x>250)
    xChange = xChange - 1;
  }
