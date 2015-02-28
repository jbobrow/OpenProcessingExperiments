
/* in this example, a bunch of ellipses are
moving with the mouse overtime.
The pivot point (i.e. mouse point) is the centre circle.

Developed by: Laura Maye, University of Limerick
*/

int x, y;
int shapeSize = 10;

void setup()
{
  size(200, 200);
}

void draw()
{
  background(255, 0, 0);
  x = mouseX;
  y = mouseY;
  fill(255, 255, 0);
  ellipse(x, y, shapeSize, shapeSize);
  ellipse(x - shapeSize, y, shapeSize, shapeSize);
  ellipse(x + shapeSize, y, shapeSize, shapeSize);
}
