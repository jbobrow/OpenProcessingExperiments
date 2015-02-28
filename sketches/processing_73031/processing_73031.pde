
/* in this example, an ellipse is positioned using the width
and height system variables.

Developed by: Laura Maye, University of Limerick
*/

//declarng GLOBAL variables for the positions of the shapes
int posX, posY;
int shapeSize;

void setup()
{
  size(200, 200);
  //setting the position of the variables to width/2 and height/2
  posX = width/2;  // (width = 200, therefore 200/2 = 100)
  posY = height/2;  // (height = 200, therefore 200/2 = 100)
  shapeSize = width/8;  // (width = 200, therefore 200/8 = 45)
}

void draw()
{
  fill(0, 0, 255);  //fill the shape blue
  ellipse(posX, posY, shapeSize, shapeSize); //use variables to position the shape
}
