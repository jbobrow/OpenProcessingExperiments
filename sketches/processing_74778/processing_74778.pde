
/* in this example, ellipses are coloured and sized depending on the mouse location
  
Developed by: Laura Maye, University of Limerick
*/

//Q: Where does the mouse have to be located for the ellipse to have a width/height of 20?
//Q: Where does the mouse have to be located for the ellipse to have a blue colour?

int posXOfMouse, posYOfMouse;
int shapeSize;

void setup()
{
  size(300, 300);
  background(0, 255, 255);
  fill(0, 0, 255);
}

void draw()
{
  posXOfMouse = mouseX;
  posYOfMouse = mouseY;
  if(posXOfMouse > width/2)
  {
    if (posYOfMouse < height/2)
    {
      fill(255, 0, 255);
      shapeSize = 20;
    }
    else
    {
      fill(0, 255, 0);
      shapeSize = 10;
    }
  }
  else
  {
    fill(0, 0, 255);
    shapeSize = 30;
  }
  ellipse(posXOfMouse, posYOfMouse, shapeSize, shapeSize);
}
