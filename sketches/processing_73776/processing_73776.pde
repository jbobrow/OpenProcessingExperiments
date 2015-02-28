
/* in this example, a cross appears on screen if the variable
r is greater than 20. r is increasing in value each time
 
Developed by: Laura Maye, University of Limerick
*/

/*Exercises: 
1. Modify this code so that if r is greater than 40 instead of 30, r resets to 0 
2. Modify this code so that if r is less than 30, an ellipse appears in the centre of the screen
3. Modify this code to display what percentage across the x axis the cursor is if r > 20
*/

float r = 0;

void setup()
{
  size(240, 120);
  smooth();
  frameRate(4);
}

void draw()
{
  background(204);
  if (r > 20) //draw a cross if r > 20
  {
    line(20, 20, 220, 100);
    line(220, 20, 20, 100);
  }
  r = r + 1;
  if (r > 30) //if r = 31, r is reset to 0
    r = 0;
}
