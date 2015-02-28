
//Em F, CP1 Mods 4-5, User Input
/**
 To create green and blue squares, press and hold the left mouse button while moving the mouse.<Br>
 To create red and blue squares, press and hold the right mouse button while moving the mouse.<Br>
 To create green and red circles, press and hold the W key while moving the mouse.
 */
void setup()
{
  size(500,500);
  background(0, 0, 0);
  noStroke();
}
void draw()
{
}
void mouseDragged()
{
  if (mouseButton==RIGHT)
  {
    fill (pmouseX, 10, pmouseY);
    rect (pmouseX, pmouseY, 35, 35);
  }
  if (mouseButton==LEFT)
  {
    fill (10, pmouseY, pmouseX);
    rect (pmouseX, pmouseY, 35, 35);
  }
}
void keyPressed()
{
  if (key=='w')
  {
    smooth();
    fill (pmouseY, pmouseX, 10);
    ellipse(pmouseX, pmouseY, 40, 40);
   
  }
}
