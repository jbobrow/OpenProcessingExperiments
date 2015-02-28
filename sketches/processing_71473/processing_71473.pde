
//Jenny H. CP1 Mods 14/15, User Input
/**
Left click and move the mouse around to get circles. 
After a while, different kinds circles will appear.
Press "B" and move the mouse to get blue rectangles.
Press "R" and move the mouse to erase your work.
*/
boolean x = true;
int w = 50;
int r = 255;
int b = 0;
int anyColor = 255;
int r1 = 0;
int b1 = 255;
int anyColor1 = 254;
void setup()
{
  size (500, 500);
  background (255, 255, 255);
}

void draw ()
{
}

void mouseDragged ()
{
  if (x == true)
  {
    fill (r, 0, b);
    noStroke ();
    ellipse (mouseX, mouseY, w, w);
    ellipse (500-mouseX, mouseY, w, w);
    w = w + 1;
    r = r - 1;
    b = b + 1;
    if (w >250)
    {
      x = false;
    }
  }

  else
  {
    stroke (255, 255, 255);
    fill (anyColor, anyColor, anyColor);
    ellipse (mouseX, mouseY, 50, 50);
    anyColor = anyColor - 1;
  }
}

void keyPressed ()
{
  if (key == 'b')
  {
    fill (r1, anyColor1, b1);
    rect (mouseX, mouseY, 50, 50);
    r1 = r1 - 5;
    b1 = b1 + 1;
    anyColor1 = anyColor1 - 1;
  }
  if (key == 'r')
  {
    fill (255, 255, 255);
    ellipse (mouseX, mouseY, 100, 100);
  }
}
