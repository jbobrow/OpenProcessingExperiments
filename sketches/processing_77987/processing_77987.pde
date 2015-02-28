
//Autor: John M.
/*Instrucciones de la tabla 
SPACEBAR = CLEAR
RIGHT CLICK = ellipse
LEFT CLICK = rect
Speed of mouse =  shape size
*/
  

boolean xPressed, aPressed;
boolean lmouse, rmouse = false;
 
void keyPressed()
{
  if (key == ' ') background(0);
}

void setup()
{
  noCursor();
  size(500, 350);
  smooth();
  noStroke();
  background(10);
}

void draw()
{
  fill(random(10, 225), random(10, 225));
  brush(mouseX, mouseY, pmouseX, pmouseY);
}
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
 
void brush(int x, int y, int px, int py)
{
  float speed = abs(x-px) + abs(y-py);
  //--------------
  if (lmouse)
  {
    ellipse(x, y, speed/2, speed/2);
  }
  else rect(x, y, speed/3, speed/3);
}


