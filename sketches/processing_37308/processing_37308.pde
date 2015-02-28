
/*Marvin Yan
 * Press all the mouse buttons, including the center button!
 * Also drag the mouse. Right button changes background color
 * Center clears*/
float y;
float x;
void setup()
{
  noStroke();
  size( 1920, 1080);
  smooth ();
  y = 50;
  x = 50;
  fill (random ( 0, 300), random (0, 300), random (0, 300));
}


void draw()
{
 if ( mouseX > pmouseX + 175)
 {
   background (random (0,250));
 }
 if (mouseX > 1000);
 {
   strokeWeight(500);
   fill (random ( 0, 300), random (0, 300), random (0, 300));
   line (mouseX-500,mouseY - 75, 1000,993);
   
 }
 
  if (mousePressed)
  {
    mouseX = mouseX;
    if (mouseButton == LEFT)
    {
      fill (random ( 0, 200), random (0, 200), random (0, 200));
    }
    if (mouseButton == RIGHT)
    {
      background(random (0, 300), random (0, 300), random (0, 300));
    }
    if (mouseButton == CENTER)
    {
      background (0);
    }
  }
  ellipse (mouseX, mouseY, x, y);
  mouseX = mouseX + 10;
  mouseY = mouseY + 3;
}

void mouseReleased()
{
  y = pmouseY;
}
void mouseDragged()
{
  x = random(0, 300);
  y = random(0, 300);
}

void mouseClicked()
  {
    fill (random ( 0, 200), random (0, 200), random (0, 200));
    triangle (mouseX+100, mouseY-250, pmouseX+95, mouseY-100, mouseX+155, pmouseY-105);
  }

