
float xPos= 0;
float yPos= 0;
void setup()
{
  size(800, 800);
  background(0);
  noStroke();
}

void draw()
{
  if (keyPressed && key == 's')
  {
    background(255, 0, 0);
  }

  if (keyPressed && key == 'd')
  {
    background(0);
  }

  xPos=mouseX;
  yPos=mouseY;
  if (mousePressed)
  {
    fill(0, 255, 0);
    ellipse(xPos, yPos, 10, 10);
  }
  if (keyPressed && key =='r')
  {
    fill(55, 66, 89);
    ellipse(xPos, yPos, 40, 40);
  }  
  if (keyPressed && key== 'f')
  {
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(xPos, yPos, 20, 20);
  }
  if (keyPressed && key== 'e')
  {
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(xPos, yPos, 40, 40);
  }
}
