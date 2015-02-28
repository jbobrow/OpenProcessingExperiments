
/* in this example, rectangles are drawn from the edge to the centre of the screen
using a for loop. Every second rectangle is coloured green
 
Developed by: Laura Maye, University of Limerick
*/

/*Qs: what is the result of:
    0 % 2?
    1 % 2?
    2 % 2?
    Modify this code so rectangles fill the entire width of the screen
*/

int posX, posY;
int shapeSize = 10;

void setup()
{
  size(300, 300);
  background(255, 0, 0);
  posY = height/2;
}

void draw()
{
  for(posX =0; posX < 15; posX = posX + 1)
  {
    if (posX % 2 == 0)
    {
      fill(255, 255, 0);
    }
    else
    {
      fill(0, 255, 0);
    }
    rect(posX*shapeSize, posY, shapeSize, shapeSize);
  }
}
