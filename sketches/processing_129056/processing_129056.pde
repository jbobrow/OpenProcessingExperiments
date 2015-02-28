
/* A little sketch that draws line
in greyscale to reveal a message written 
in background colour */

int a; // changes the colour of the stroke

void setup ()
{
  size (500, 500); 
  background (0);
  a=0;
  textSize (24); // text in the start screen 
  stroke (255);
  text ("Move cursor across", 100, 400);
  text ("Click right to start", 100, 200);
}

void draw ()
{
   a++;
  stroke (a);
  line (0, mouseY, 500, mouseY);
  if (a == 100)
  {
    a = 0;
  }
  textSize (48); // text to be revealed
  colorMode (HSB, 100);
  fill (0,100,0,50);
  text ("Stay curious", 110, 250);
  if (mousePressed && (mouseButton == RIGHT)) // to restart 
 {
  background (0);
 } 
}


