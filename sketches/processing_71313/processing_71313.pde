
//Brian C, User Input, CP1 Mods 16/17

void setup()
{
  size(500,500);
  background(0);
}
void draw()
{
}
void keyPressed()
{
  if (key == 'y')
  {
    fill(240,240,0,50);
    ellipse(mouseX,mouseY,20,20);
    ellipse(500-mouseX,500-mouseY,30,30);
  }
  if (key == 'w')
  {
    fill(255);
    ellipse(mouseX,mouseY,20,20);
    ellipse(500-mouseX,500-mouseY,30,30);
  }
  if (key == 'r')
  {
    fill(0,0,0,20);
    rect(0,0,500,500);
  }
  if (key == 'e')
  {
    fill(255,255,255,20);
    rect(0,0,500,500);
  }
  if (key == 'q')
  {
    fill(0);
    rect(0,0,500,500);
  }
}
void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    stroke(0);
    ellipse(mouseX,mouseY,20,20);
    ellipse(500-mouseX,500-mouseY,30,30);
  }
  if (mouseButton == RIGHT)
  {
    rect(mouseX,mouseY,30,40);
    rect(500-mouseX,500-mouseY,30,40);
  }
}
/**
Press the left key and drag to make ellipses.<br>
Press the right key and drag to make rectangles.<br>
Press the y key to make the shapes yellow.<br>
Press the w key to make the shapes white.<br>
Press the r key to make everything darker.<br>
Press the e key to make everything lighter.<br>
Press the q key to start over with a black screen.<br>
*/
