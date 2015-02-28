
//Keith Joseph - kejoseph@andrew.cmu.edu
//copyright Keith Joseph 1/23/2013
//HW3 Computing for the Arts with Processing

float x, y, wd, ht;

void setup ( )
{
  size (400, 400);
  smooth ( );
  background (0); 
  noStroke ( );
  
  x = width;
  y = height;
  wd = width;
  ht = height;
  
  frameRate (10);
}

void draw ( )
{
  fill (random (0, 250) );
  rect (mouseX, mouseY, wd * .25, ht * .1);
  
  //saveFrame("hw3.jpg");
}




