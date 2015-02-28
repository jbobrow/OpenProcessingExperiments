
float xPos = 0;
float yPos = 0;

void setup()
{
  size(1000, 1000);
  background(245, 2, 2);
}

void draw()
{

  //xPos = xPos + 10;
  //yPos = yPos + 2

  xPos = mouseX;
  yPos = mouseY;

  if (mousePressed)
  {
    fill(0);
    ellipse(xPos, yPos, 50, 50);
  }


  if (keyPressed && key == 's')
  {
    ellipse(xPos, yPos, 80, 80);
  }
  if (keyPressed && key =='r')
  {
    background(245, 2, 2);
  }
  if (keyPressed && key == 't')
  {
    random(0, 255);
    background(random(255), random(255), random(255));
  }
  
}
