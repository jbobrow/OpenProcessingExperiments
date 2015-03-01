
float easingVal = 0.2;
float currentX = 0;
float currentY = 0;

void setup()
{
  size(400, 400);
}

void draw()
{
  background(0, 0, 0);
  
  float xDifference = mouseX - currentX;
  float yDifference = mouseY - currentY;
  
  float newPosX = currentX + (xDifference*easingVal);
  float newPosY = currentY + (yDifference*easingVal);
  
  fill(250, 250, 250);
  ellipseMode(CENTER);
  ellipse(newPosX, newPosY, 50, 50);
  
  currentX = newPosX;
  currentY = newPosY;
}


