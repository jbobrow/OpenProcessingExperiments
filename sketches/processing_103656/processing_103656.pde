
float xPos = 0;
float yPos = 0;

void setup()
{
  size(800, 800);
  background(255);
}

void draw()
{
  //background(255);
  //ellipse(xPos, yPos, 50, 50);
  
  xPos = mouseX;
  yPos = mouseY;
  
  if (mousePressed)
  {
    int randBoolean = int(random(1,10));
    if(randBoolean <= 5)
    {
    fill(0, 0, 0);
    }
    if (randBoolean > 5)
    {
      fill(255, 255, 255);
    }
    rect(xPos, yPos, 50, 50);
  }
  else
  {
    random(0, 255);
    fill(random(255), random(255), random(255));
    ellipse(xPos, yPos, 50, 50);
  }
  
  if (keyPressed && key == 'r')
  {
    background(255, 0, 0);
  }
  if (keyPressed && key == 'g')
  {
    background(0, 255, 0);
  }
  if (keyPressed && key == 'b')
  {
    background(0, 0, 255);
  }
  if (keyPressed && key == 's')
  {
    random(0, 255);
    background(random(255), random(255), random(255));
  }
}
