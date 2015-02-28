
/*This is the solution to last week's lab (week 8)

Developed by Laura Maye, University of Limerick
*/

int shapeSize = 20;
int locXOfShape, locYOfShape;

void setup()
{
  size(220, 100);
  frameRate(20);
}

void draw()
{
  background(0);
  fillColour(mouseX, mouseY);
  drawCircles();
}

void drawCircles()
{
  for (int x = 1; x < 11; x = x + 1)
  {
    for (int y = 1; y < 5; y = y + 1)
    {
      locXOfShape = x * shapeSize;
      locYOfShape = y * shapeSize;
      ellipse(locXOfShape, locYOfShape, shapeSize, shapeSize);
      println("The ellipse has drawn at co-ordinate: (" + locXOfShape + ", " + locYOfShape + ")");
    }
  }
}

void fillColour(int mousePosX, int mousePosY)
{
   if (mousePosX < width/2 && mousePosY < height/2) // if the cursor is on the top left of the screen, colour yellow
  {
    fill(255, 255, 0);
    strokeWeight(5);
   stroke(0, 0, 255);
   shapeSize = 20;
  }
  else if (mousePosX > width/2 && mousePosY < height/2) // if the cursor is on the top right of the screen, colour green
  {
    fill(0, 255, 0);
    strokeWeight(0);
    stroke(0);
    shapeSize = 40;
  }
  else if (mousePosX < width/2 && mousePosY > height/2) //if the cursor is on the bottom left of the screen, colour cyan
  {
    fill(0, 255, 255);
    shapeSize = shapeSize + 1;
  }
  else // if the cursor is on the bottom right of teh screen, colour blue
  {
    fill(mouseX, 0, 255);
    shapeSize = 50;
  }
}
