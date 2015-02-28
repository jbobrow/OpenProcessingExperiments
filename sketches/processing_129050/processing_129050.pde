
/* A sketch which draws a row of squares to
reveal a message written in background colour. 
Right click to redraw background; left click to 
change the colour of the drawing; x and y of mouse are 
turned around, making it more complex to figure out how to draw */

int a; // this variable controls the hue 

void setup ()
{
  size (500, 500);
  background (0);
  noStroke ();
  a = 0;
  textSize (24); // text on the start window
  fill (255);
  text ("Move cursor across", 125, 225);
 text ("Click left to change colour", 100, 325); 
 text ("Click right to start", 125, 125);
  }

void draw ()
{
  if (mousePressed && (mouseButton == LEFT)) 
  {
      a++;
  }
   colorMode (HSB, 100); 
   fill (a, 75, 100, 25); 
 rect (mouseY, mouseX, 35, 35);
  if (a == 100)
  {
    a = 0;
  }
  textSize (72); // text to be revealed
  fill (0);
  text ("Find", 200, 100);
  text ("beauty", 100, 200); 
  text ("in", 230, 300);
  text ("chaos", 100, 400);
  if (mousePressed && (mouseButton == RIGHT))
  {
    background (0);
  }
  }

  


