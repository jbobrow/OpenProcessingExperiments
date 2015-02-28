
//Eric K, CP1 mods 4-5, Ticklish Penguin
//url: http://ericsprogrammingsite.com/Ticklish_Penguin.html

/* @pjs globalKeyEvents="true"; */

/**
  The line moves in a random walk.<p>
  
  Left-click to cause the line to follow the mouse.<br>
  Right-click to start over from a different point.<br>
  Press and hold "f" for fast-forward mode.
*/

float xi = 250;
float x = xi;
float pX = x;
float yi = 250;
float y = yi;
float pY = y;
void setup()
{
  size(500, 500);
  colorMode(HSB, 360);
  background(0);
  frameRate(60);
}
void draw()
{
  drawLine();
  moveLine();
  fastForward();
}
void drawLine()
{
  if (x - xi != 0 || y - yi != 0)
  {
    stroke((180*(atan2(x-xi, y-yi))/PI+360) % 360, 360, 360);
  }
  else
  {
    stroke(0, 0, 0);
  }
  line(pX, pY, x, y);
}
void moveLine()
{
  pX = x;
  pY = y;
  x = x + int(random(-5, 5));
  y = y + int(random(-5, 5));
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      x = x + int(random((mouseX-x)/150 - 4, (mouseX-x)/150 + 4));
      y = y + int(random((mouseY-y)/150 - 4, (mouseY-y)/150 + 4));
    }
    else
    {
      x = x + int(random(-8, 8));
      y = y + int(random(-8, 8));
    }
    if (mouseButton == RIGHT)
    {
      background(0, 0, 0);
      xi = mouseX;
      yi = mouseY;
      x = xi;
      y = yi;
      pX = x;
      pY = y;
    }
  }
  if (x > width)
  {
    x = width;
  }
  if (x < 0)
  {
    x = 0;
  }
  if (y > height)
  {
    y = height;
  }
  if (y < 0)
  {
    y = 0;
  }
}
void fastForward()
{
  if(keyPressed == true)
  {
    if(key == 'f')
    {
      frameRate(300);
    }
  }
  else
  {
    frameRate(60);
  }
}
