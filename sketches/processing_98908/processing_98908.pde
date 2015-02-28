

void setup()
{
  size(400, 400);
  background(255, 255, 255);
  smooth();

  
}

void draw()
{
  if (mouseY <= height/2 )
  {
    fill(0, 0, 255);
  }

  if (mouseY > height/2 )
  {
    fill(255, 0, 0);
  }

  ellipse(mouseX, mouseY, 50, 50);
  
}
