
//Tina L., CP1 14/15 User Input
void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
}
void mouseDragged()
{
  line(mouseX, mouseY, pmouseX, pmouseY);
  if (mouseButton == LEFT)
  {
    strokeWeight(3);
    line(500-mouseX, mouseY, 500-pmouseX, pmouseY);
    stroke(255);
  }
  if (mouseButton == RIGHT)
  {
    strokeWeight(10);
    stroke(0);
  }
}
void keyPressed()
{
  noFill();
  strokeWeight(2);
  ellipse(mouseX, mouseY, 20, 20);
  if (key == 'w')
  {
    stroke(255);
  }
  if (key == 'y')
  {
    stroke(255, 255, 0);
  }
  if (key == 'r')
  {
    stroke(255, 0, 0);
  }
  if (key == 'g')
  {
    stroke(0, 255, 0);
  }
  if (key == 'b')
  {
    stroke(0, 0, 255);
  }
  if (key == 'p')
  {
    stroke(195, 3, 255);
  }
  if(key == 'o')
  {
    stroke(255,100,0);
  }
}
