
/*
KEYS:
SPACEBAR = CLEAR
RIGHT CLICK = SQUARE
LEFT CLICK = CIRCLE
Speed of mouse =  shape size
 
made by Miranda Kuang
*/
 
//---------------------------------------------------------------
boolean xPressed, aPressed;
boolean lmouse, rmouse = false;
float f, k;
 
void keyPressed()
{
  if (key == ' ') background(255);
}
//-----------------
void setup()
{
  noCursor();
  size(1000, 700);
  smooth();
  noStroke();
  background(255);
  f = random(0, 255);
  k = 255;
  colorMode(HSB, 255);
  color c = color(random(75,255), random(75,255), random(75,255));
  fill(c);
  float value = brightness(c);
  fill(value);
}
//---------------
void draw()
{
  fill(random(75, 225), random(75, 225), random(75, 225));
  brush(mouseX, mouseY, pmouseX, pmouseY);
}
//-------------
void mousePressed()
{
  if (mouseButton == LEFT)
  {
    lmouse = true;
  }
  if (mouseButton == RIGHT)
  {
    lmouse = false;
  }
}
 
//-------------
void brush(int x, int y, int px, int py)
{
  float speed = abs(x-px) + abs(y-py);
  //--------------
  if (lmouse)
  {
    rect(x, y, speed/2, speed/2);
  }
  else ellipse(x, y, speed/2, speed/2);
}

