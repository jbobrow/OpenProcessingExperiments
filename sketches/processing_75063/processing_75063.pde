
/* in this example, ellipses are drawn from a quater the way down the
screen. They become more red in colour each time the while loop runs.

Developed by: Laura Maye, University of Limerick
*/

int posX, posY;
int shapeSize= 20;
float r, g, b;

void setup()
{
    size(300, 150);
    background(255);
    posX = 0;
    posY = height/4;
    r = 0;
    g = 0;
    b = 0;
}

void draw()
{
  //draw circles while posX is less than width
  while(posX < width)
  {
    //update the red value pixel to half the value of posX
    //This is so the ellipses become redder each time the while loop runs!
    r = posX/2;
    fill(r, g, b);
    ellipse(posX, posY, shapeSize, shapeSize);
    posX = posX + shapeSize;
  }
}
