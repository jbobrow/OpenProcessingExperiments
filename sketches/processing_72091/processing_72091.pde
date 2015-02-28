
/* a simple moving square across the
x axis of the screen

Developed by: Laura Maye, University of Liemrick
*/

int x = 0, y = 0;
int shapeSize = 10;

void setup()
{
  background(255, 0, 0);
}

void draw()
{
  rect(x, y, shapeSize, shapeSize);
  println("x: " + x + " y: " + y);
  x = x + 1;
}

