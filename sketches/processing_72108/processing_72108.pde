
/* in this example, a shape grows overtime
and changes colour overtime. 

Developed by: Laura Maye, University of Limerick
*/

//declaring variables
int x, y;
float r;
float shapeSize = 10;

void setup()
{
  rectMode(CENTER);
  size(300, 300);
  background(255, 255, 0);
  // setting the x and y co-ordinates to the centre of the screen
  x = width/2;
  y = height/2;
}

void draw()
{
  //scaling the red value from between 0 and 300 to 0 and 255
  //the higher the shapeSize variable, the more red the shape will be!
  r = shapeSize / width * 255;
  fill(r, 0, 0);
  rect(x, y, shapeSize, shapeSize);
  //adding 1 to the shape's size each time draw executes
  shapeSize = shapeSize + 1;
  println("Red value: " + r);
}
