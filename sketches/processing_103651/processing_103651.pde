
float xPos = 0;
float yPos = 0;
void setup ()
{
  size (800, 800);
  background (225,225,225);
}
void draw()
{

  xPos = mouseX;
  yPos = mouseY;
  if (mousePressed)
  {
    rect(xPos, yPos, 25, 25);
  }

  if (key == 'h' && keyPressed)
 {
   fill (0);
  }
  else {
    fill (225, 225, 225);
  }
  if (key == 'b' && keyPressed)
  {
    fill(0, 0, 225);
  }
  if (key == 'g' && keyPressed)
  { 
    fill (0, 225, 0);
  }
  if (key == 'r' && keyPressed)
  {
    fill (225, 0, 0);
  }
  if (key == 'y' && keyPressed)
  {
    fill (247, 240, 12);
  }
  if (key == 'p' && keyPressed)
 {
   fill (154,7,229);
 }
if (key == ' ' && keyPressed) 
{
  background (225,225,225);
}
if (key == 'q' && keyPressed)
{ xPos = mouseX;
yPos = mouseY;
rect(xPos, yPos, 50, 50);
}
if (key == 'w' && keyPressed)
{
  xPos = mouseX;
  yPos = mouseY;
  rect(xPos, yPos, 100, 100);
}
}
