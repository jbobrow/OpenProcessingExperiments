
/* in this example, the background is white if the mouse locates above the line.
The background is grey if the mouse locates below the line
  
Developed by: Laura Maye, University of Limerick
*/

/* Exercises:
1. Modify the code so that a line runs down the middle of the screen rather than across the screen.
Modify the code again so when the mouse is on the left hand side of the line, the background is white.
If it is on the right hand side of the line, the background is grey */

int halfScreenY, locationY;

void setup()
{
  size(400, 400);
  smooth();
  background(255);
}

void draw()
{
  locationY = mouseY;
  halfScreenY = height/2;
  if (locationY <= halfScreenY) //background is white if mouse is above the line
    background(255);
  else //background is grey if mouse is below the line
    background(150);
  line(0, halfScreenY, width, halfScreenY);
}
