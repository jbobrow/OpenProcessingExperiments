
/*Multiple rectangles are drawn on screen in this example.
Answer the questions provided in the comments 

Developed by Laura Maye, University of Limerick*/
 
/* Q: Modify this code so that, when a mouse is pressed, the shapes fill blue
   Q: Modify code again so that, when a key is pressed, the shapes fill yellow
   Q: Modify the code so that there is more than a spacing of 20 pixels between each rectangle
*/


int x = 0;
int y = 0;

void setup()
{
  size(200, 200);
  background(0);
  x = width/2;
}

void draw()
{
  y = 0;
  rect(x, y*40, 20, 20);
  y = y + 1;
  rect(x, y*40, 20, 20);
  y = y + 1;
  rect(x, y*40, 20, 20);
  y = y + 1;
  rect(x, y*40, 20, 20);
}
