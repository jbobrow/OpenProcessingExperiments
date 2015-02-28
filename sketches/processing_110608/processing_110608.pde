
//Kevin Lim, User Input, Block: 7, CP1
void setup()
{
  size(500,500);
}
void draw()
{
  fill(209,209,209,50);
  rect(0,0,500,500);
}
void keyPressed()
{
  if (key == 'b')
  {
    stroke(0,0,255);
    fill(0,0,255);
  }
  if (key == 'g')
  {
    stroke(0,255,0);
    fill(0,255,0);
  }
  if (key == 'r')
  {
    stroke(255,0,0);
    fill(255,0,0);
  }
  if (key == 'o')
  {
    stroke(255,162,0);
  }
  if (key == 'p')
  {
    stroke(154,0,255);
  }
  if (key == '1')
  {
    stroke(0);
  }
}
void mouseDragged()
{
  if (mouseButton==LEFT)
  {
    ellipse(mouseX,mouseY,50,50);
    ellipse(500-mouseX,mouseY,50,50);
    ellipse(mouseX,500-mouseY,50,50);
    ellipse(500-mouseX,500-mouseY,50,50);
  }
  if (mouseButton==RIGHT)
  {
    rect(mouseX,mouseY,50,50);
    rect(500-mouseX,mouseY,50,50);
    rect(mouseX,500-mouseY,50,50);
    rect(500-mouseX,500-mouseY,50,50);
  }
  if (mouseButton==CENTER)
  {
    line(mouseX,mouseY,250,250);
    line(500-mouseX,mouseY,250,250);
    line(mouseX,500-mouseY,250,250);
    line(500-mouseX,500-mouseY,250,250);
  }
}


