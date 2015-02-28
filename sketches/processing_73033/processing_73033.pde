
/* in this example, the ellipse's red value increases by 10
when the mouse is pressed
the ellipses green value increases by 10 when a key is pressed

Developed by: Laura Maye, University of Limerick
*/
int x, y;
//declaring variables that will eventually be used for colouring the shape
int r = 0, g = 0, b = 0;
int shapeSize = 10;

void setup()
{
  size(200, 200);
  background(255);
}

void draw()
{
  x = mouseX;
  y = mouseY;
  fill(r, g, b);
  ellipse(x, y, shapeSize, shapeSize);
}

void mousePressed()
{
  r = r + 10;
}

void keyPressed()
{
  g = g + 10;
}
