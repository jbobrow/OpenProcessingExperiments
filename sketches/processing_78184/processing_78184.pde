
/*One rectangle is drawn on screen in this example.
Answer the question provided in the comments 

Developed by Laura Maye, University of Limerick*/
 
/* Q: Modify this code so that, when a key is pressed,
   a rectangle draws 20 pixels underneath the previous one.
   This should continuously happen when a key is pressd
*/


int x = 0;
int y = 0;

void setup()
{
  size(200, 200);
  background(0);
  y = 0;
  x = width/2;
}

void draw()
{
  rect(x, y*40, 20, 20);
}

void keyPressed()
{
  y = y + 1;
}
