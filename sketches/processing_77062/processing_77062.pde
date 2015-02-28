
/* in this example, a homer's face is being drawn on the screen using a function
passing in arguments
  
Developed by: Laura Maye, University of Limerick
*/
 
/*Qs: What is causing homer to be drawn twice, only shifted across the x axis?
      modify code to include another argument for the function: to shift homer across
      the y axis as well.
      
*/
 

void setup()
{
  size(300, 300);
  background(255);
}

void draw()
{
  drawHomer(0);
  drawHomer(100);
}

void drawHomer(int ox)
{
  int offsetX = ox;
  noStroke();
  fill(255, 255, 0);
  ellipse(40 + offsetX, 60, 60, 60);
  ellipse(40 + offsetX, 130, 60, 60);
  rect(10 + offsetX, 60, 60, 70);
  stroke(0);
  
  fill(255);
  ellipse(25 + offsetX, 70, 20, 20);
  ellipse(55 + offsetX, 70, 20, 20);
  point(25 + offsetX, 70);
  point(55 + offsetX, 70);
  
  fill(255, 200, 100);
  ellipse(40 + offsetX, 110, 40, 40);
  line(20 + offsetX, 110, 60 + offsetX, 110);
}
