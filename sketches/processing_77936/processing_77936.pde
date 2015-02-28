
/*This example demonstrates how to calculate and return  a percentage using a function

developed by Laura Maye, Unoversity of Limerick */

/* Q. Modify thisfunction  so it calculates how far (in pixels) the ellipse has to travel until
it hits the edge of the screen */

int locX, locY;
int percentageX;

void setup()
{
  size(400, 400);
  background(255, 255, 0);
  locX = 50;
  locY = height/2;
  fill(0);
}

void draw()
{
  background(255, 255, 0);
  ellipse(locX, locY, 20, 20);
  percentageX = getPercentageAcross(locX);
  text("the ellipse's x position is: " + percentageX + "% across the screen", 20, height - 50);
  if (locX < width)
  {
    locX = locX + 1;
  }
}

int getPercentageAcross(int x)
{
  int posX = x;
  int percent = posX*100/width;
  return percent;
}
