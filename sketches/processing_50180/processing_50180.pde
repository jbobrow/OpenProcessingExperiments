
//Homework 3
//copyright ben corwin 2012
float a, b;

void setup()
{
  size( 400, 400);
  background(0,0,0);
  noStroke();
  textSize(10);
  smooth();
  a = 0;
  b = 0;
  
}

void draw( )
{
  
  fill(0,0,0,5);
  rect(0, 0, width, height);
  fill(50 * (pmouseY - mouseY),pmouseX - mouseX,200);
  ellipse(mouseX, mouseY, 7.5 * ((abs(pmouseY - mouseY)+abs(pmouseX - mouseX))/2), 7.5 * ((abs(pmouseY - mouseY)+abs(pmouseX - mouseX))/2));
  a = a + .040;
  b = b + .040;
 

 
}                                                                               
