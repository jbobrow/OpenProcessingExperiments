
//Keith Joseph | kejoseph@andrew.cmu.edu
//HW4 | Computing for the Arts with Processing
//Copyright Keith Joseph, 1/29/13 Pittsburgh, PA

float x, y, wd, ht;

void setup ( )
{
  size (400, 400);
  smooth ( );
  background (0); 
  noFill ( );
  
  x = width;
  y = height;
  wd = 50;
  ht = 25;
  
  frameRate (20);
}

void draw ( )
{

  rect (mouseX, mouseY, wd * .25, ht * .1);

}  
void keyPressed()
{
  if ( key == ' ' )
  {
  stroke (random(255), random(255), random(255));
  }  
  
  
  
//saveFrame("hw4a.jpg");

}


