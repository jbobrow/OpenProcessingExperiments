
//Jonathan Huang,CP 1, mods 16-17

void setup()
{
  size(500, 500);
  background(0);
  noFill();
  stroke(255, 255, 255);
}
void draw()
{
}
void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    rect(mouseX, mouseY, 25, 25);
    rect(500-mouseX, mouseY, 25, 25);
    rect(mouseX, 500-mouseY, 25, 25);
    rect(500-mouseX, 500-mouseY, 25, 25);
  }
  if (mouseButton == RIGHT)
  {
    ellipse(mouseX, mouseY, 25, 25);
    ellipse(500-mouseX, mouseY, 25, 25);
    ellipse(mouseX, 500-mouseY, 25, 25);
    ellipse(500-mouseX, 500-mouseY, 25, 25);
  }
}
void keyPressed()
{
  if (key == 'e')
  {
    background(0);
  }
  if ( key =='r')
  {
    stroke(255, 0, 0);
  }
  if ( key =='b')
  {
    stroke( 0, 0, 255);
  }
  if (key == 'g')
  {
    stroke(0, 255, 0);
  }
  if (key == 'y')
  {
    stroke(250, 255, 0);
  }
}
