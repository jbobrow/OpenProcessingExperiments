
/* in this example, ellipses are drawn between the y pixel locations of
height/4 and eight/4 + the height of teh rectangle. This is so the ellipses
are drawn between the top and bottom bounds of the rectangle
  
Developed by: Laura Maye, University of Limerick
*/

//Q: Modify this code so the ellipses are drawn within the bounds of the rect!

int w, h;
int posXOfMouse, posYOfMouse;
int shapeSize = 10;

void setup()
{
  size(400, 200);
  background(255, 255, 0);
  w = width/4;
  h = height/4;
  //I'm drawing the rectangle here so it doesn't draw over the ellipses
  fill(255);
  rect(width/4, height/4, w*2, h*2);
}

void draw()
{
  posXOfMouse = mouseX;
  posYOfMouse = mouseY;
  fill(255, 0, 255, 100);
  noStroke();
  //If the mouseY location is between the top and bottom bounds of the rect
  if(posYOfMouse > height/4 && posYOfMouse < height/4 + h*2)
  {
      ellipse(posXOfMouse, posYOfMouse, shapeSize, shapeSize);
  }
}
