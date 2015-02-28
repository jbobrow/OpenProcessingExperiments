
//Cristen W, CP1, Mods 16/17, User Input
/**
To make grey cirlces, press and hold the left mouse button. <br>
To make red circles, press r once and hold the left mouse button. <br>
To make blue rectangles, press and hold the right mouse button. <br>
To make yellow rectangles, press y once and hold the right mouse button. <br>
To make the original two colors of the cirlces and rectangles, press o and hold the respective mouse buttons. <br>
To reset the screen, press w.
*/


int r = 156;
int g = 160;
int b = 158;
int r1 = 12;
int g1 = 154;
int b1 = 167;

void setup()
{
  size(500, 500);
  background(255);
}
void draw()
{
}

void mouseDragged()
{
  if (mouseButton==LEFT)
  {
    fill(r, g, b, 100);
    ellipse(mouseX, mouseY, 50, 50);
    ellipse(500-mouseX, 500-mouseY, 50, 50);
  }
  if (mouseButton==RIGHT)
  {
    fill(r1, g1, b1, 100);
    rect(mouseX, mouseY, 90, 50);
    rect(500-mouseX, 500-mouseY, 90,50);
  }
}

void keyPressed()
{
  if (key == 'r')
  {
    r = 147;
    g = 47;
    b = 47;
  }
  if (key == 'o')
  {
    r = 156;
    g = 160;
    b = 158;
  }
  if (key =='y')
  {
    r1 = 240;
    g1 = 234;
    b1 = 121;
  }
  if (key == 'o')
  {
    r1 = 12;
    g1 = 154;
    b1 = 167;
  }
  if (key == 'w')
  {
    fill(255);
    rect(0, 0, 500, 500);
  }
}
