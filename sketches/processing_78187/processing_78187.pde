
/* The following exmample draws an ellipse on screen, following certain conditions.
 
Developed by Laura Maye, University of Limerick*/
  
/* Q: Take time to understand what the code is doing.
    a. Modify this code so that the draw function only runs 20 times per second
    b. If the counter is less than 10, the shape should colour yellow
    c. If the counter is greater than 20, the stroke weight should set
    to be 5. In any other condition, it should be set to 0.
*/


int counter;

void setup()
{
  size(400, 200);
  background(255);
  counter = 0;
}

void draw()
{
  background(255);
  if (counter < 20)
  {
    fill(255, 0, 255);
  }
  else
  {
    fill(0, 0, 255);
  }
  if (counter > 40)
  {
    counter = 0;
  }
  ellipse(width/2, height/2, 50, 50);
  counter = counter + 1;
}
