
PImage skull;
PImage texas;
color brushColor;
void setup()
{
  size(500,500);
  skull = requestImage("skull.jpg");
  texas = requestImage("texas.jpg");
  background(255);
}

void draw()
{
  noStroke();
  fill(255,0,0);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      fill(0);
      ellipse(mouseX, mouseY, 10, 10);
    }
    if (mouseButton == RIGHT)
    {
      fill(0,255,0);
      ellipse(mouseX, mouseY, 10, 10);
    }
  }
  if (keyPressed)
  {
    if (key == '1')
    {
      image(skull, mouseX, mouseY, 30, 30);
    }
    if (key == '2')
    {
      image(texas, mouseX, mouseY, 30, 30);
    }
  }
}


