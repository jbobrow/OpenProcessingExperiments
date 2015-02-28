
/* in this example, a face is being drawn on the screen using a function
  
Developed by: Laura Maye, University of Limerick
*/
 
/*Qs: What is an argument?
      Modify code so it accepts ONE argument: an offset value for positioning the shape
      along the x axis.
*/
 

void setup()
{
  size(200, 200);
  background(255);
}

void draw()
{
  drawFace();
}

void drawFace()
{
  fill(255, 255, 0);
  rect(20, 50, 50, 60);
  fill(0, 0, 255);
  ellipse(30, 60, 10, 10);
  ellipse(60, 60, 10, 10);
  line(25, 100, 65, 100);
}
