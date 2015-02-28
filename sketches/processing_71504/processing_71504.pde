
//Lisa L, User Input, CP1 Mods 16/17

int r = 173;
int g = 70;
int b = 211;
int o = 100;
void setup()
{
  size(500,500);
  background(0);
}
void draw()
{
}
void mousePressed()
{
  if(mouseButton == LEFT)
  {
    fill(r,g,b,o);
    ellipse(mouseX,mouseY,45,45);
  }
  if(mouseButton == RIGHT)
  {
    fill(r,g,b,o);
    ellipse(mouseX,mouseY,45,45);
    ellipse(500-mouseX,mouseY,45,45);
    ellipse(500-mouseX,500-mouseY,45,45);
    ellipse(mouseX,500-mouseY,45,45);
  }
}
void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    fill(r,g,b,o);
    ellipse(mouseX,mouseY,45,45);
  }
  if(mouseButton == RIGHT)
  {
    ellipse(mouseX,mouseY,45,45);
    ellipse(500-mouseX,mouseY,45,45);
    ellipse(500-mouseX,500-mouseY,45,45);
    ellipse(mouseX,500-mouseY,45,45);
  }
}
void keyPressed()
{
  if(key == 'd' && o <= 250)
  {
    o = o + 5;
  }
  if(key == 'f' && o >= 20)
  {
    o = o - 5;
  }
  if(key == 'h')
  {
    r = 173;
    g = 70;
    b = 211;
  }
  if(key == 'b')
  {
   r = 121;
   g = 197;
   b = 234;
  }
  if(key == 'g')
  {
    r = 137;
    g = 234;
    b = 143;
  }
  if(key == 'c')
  {
    fill(0);
    rect(0,0,500,500);
  }
}

/**
Click the left mouse button to draw one circle.<br>
Click and drag the left mouse to continuously draw circles.<br>
Click the right mouse button to draw four symmetrical circles.<br>
Click and drag the right mouse button to continuously draw four symmetrical circles.<br>
Press h for purple.<br>
Press b for blue.<br>
Press g for green.<br>
Press d to make the color darker.<br>
Press f to make the color lighter.<br>
Press c to clear the screen.
*/
