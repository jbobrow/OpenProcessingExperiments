
/* in this example, rectangles are drawn from the centre of the screen.
Initially, the shapeSize is set to the height of the screen; then, the
shapeSize gets smaller by 20 pixels each time

Developed by: Laura Maye, University of Limerick
*/

int posX, posY;

void setup()
{
    size(200, 200);
    //setting rectangles to draw from centre
    rectMode(CENTER);
    posX = width/2;
    posY = height/2;
}

void draw()
{
  //draw rectangles of width and height of shapeSize, while the shapeSize
  //is greater than 10.
  for(int shapeSize = height; shapeSize > 10; shapeSize = shapeSize - 20)
  {
    rect(posX, posY, shapeSize, shapeSize);
  }
}
