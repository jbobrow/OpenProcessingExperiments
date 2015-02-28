
float xPos = 0;
float yPos = 0;

void setup()
{
  size(800, 800);
  background(0);
  noStroke();
}


void draw()
{
  background(0);
  
  xPos = mouseX;
  yPos = mouseY;

  if (keyPressed && key == 's')
  {
    background(3, 103, 201);
    
    if (mousePressed)
  {
    ellipse(xPos, yPos, 50, 50);
  }
  else
  {
    ellipse(xPos, yPos, 50, 50);
  }
  }
}
