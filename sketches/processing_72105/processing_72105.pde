
/* The following example demonstrates how to use variables

Developed by: Laura Maye, University of Limerick
*/

//initialising variables that will eventually be used to colour shapes
int r, g = 255, b = 0;
int x, y;

void setup()
{
  rectMode(CENTER);
  size(200, 200);
  background(0);
  //setting the x and y co-ordinates to half the width and height of the screen
  x = width/2;
  y = height/2;
}

void draw()
{
  r = 0;
  //filling the big rectangle
  fill(r, g, b);
  rect(x, y, 100, 80);
  
  println("Initial red  value: " + r);
  
  //reinitilising the red value
  r = 200;
  //re-filling the shape
  fill(r, g, b);
  rect(x, y, 20, 80);
  println("New red  value: " + r);
}
