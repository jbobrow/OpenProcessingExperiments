
float xPos = 0;
float yPos = 0;
float size = 50;
void setup()
{
  size(800, 800);
  background(0);
}

void draw()
{
  textSize(20);
  text("Press r for red, press b for blue, press g for green, and press a for random color.", 0, 100);
  text("Click to change background color randomly or press c for background to reset.", 0, 120);
  text("Press s to shrink the brush and e to enlarge the brush, and n to return to normal.", 0, 140);
  xPos=mouseX;
  yPos=mouseY;
  if (key == 'r' && keyPressed)
  {
    fill(255, 0, 0);
    rect(xPos, yPos, size, size);
  }
  if (key == 'g' && keyPressed)
  {
    fill(0, 255, 0);
    rect(xPos, yPos, size, size);
  }
  if (key == 'b' && keyPressed)
  {
    fill(0, 0, 255);
    rect(xPos, yPos, size, size);
  }
  if (key == 'a' && keyPressed)
  {
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(xPos, yPos, size, size);
  }
  if (key == 'c' && keyPressed)
  {
    background(0, 0, 0);
  }
  if (key == 'e' && keyPressed)
  {
    size=75;
  }
  if (key == 's' && keyPressed)
  {
    size=25;
  }
  if (key == 'n' && keyPressed)
  {
    size=50;
  }
}

void mouseClicked()
{

  background(random(0, 255), random(0, 255), random(0, 255));
}
