
int fillx = 0;

void setup ()
{
  size (750, 400);
    }

void draw ()
{
  // set background and draw circle
  background (#FFFFFF);
  stroke (#000000);
    fill (fillx, 750, 750);
    ellipse (60, 220, 100, 100);
  // draws the rainbow
  colorMode (HSB, 750);
  for (int x = 0; x < width; x++)
  {
    stroke (x, 750,750);
    line (x,10, x,100);
  }
  // the colourpicker
  if (mousePressed && (mouseButton == LEFT))
  {
    if (mouseY > 60 && (mouseY < 160))
    {
   fillx = mouseX;
  stroke (#000000);
  fill (mouseX, 750, 750);
  ellipse (mouseX, 110, 100, 100);
   }
  }
  stroke (#000000);
  fill (#FFFFFF);
  rect (250, 200, 400, 60, 6);
  rect (250, 300, 400, 60, 6);
  fill (#000000);
  text ("What happened?", 250, 185);
  text ("What could you have made different?", 250, 285);
     }
    



