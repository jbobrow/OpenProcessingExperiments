
// Victor Murillo, CP1 mods 16-17, User Input
void setup()
{
  size(400, 400);
  background(0);
  stroke(0, 0, 255);
}
void draw()
{
}
void mouseDragged()
{
  if (mouseButton == LEFT)
  {  
    noFill();
    stroke(0, 0,255);
    ellipse(mouseX, mouseY, 50, 50);
    ellipse(400-mouseX, mouseY, 50, 50);
  }
  if (mouseButton == RIGHT)
  {
    stroke(255, 255, 255);
    fill(33,124,9);
    rect(mouseX, mouseY, 30, 30);
    rect(400-mouseX, mouseY, 30, 30);
  }
}
void keyPressed()
{
  if (key == 'r')
  {
    fill(255,0,0);
    stroke(255,0,0);
    ellipse(mouseX, mouseY,50,50);
  }
  if (key == 'q')
  {
    rect(0,0,500,500);
    fill(0,0,0);
    stroke(0,0,0);
  }
}
