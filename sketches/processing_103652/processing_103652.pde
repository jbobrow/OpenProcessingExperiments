
int screenWidth = 800;
int screenHeight = 600;

void setup()

{
  size(screenWidth, screenHeight);
  background(100 , 100, 255);
  
  
  drawTree(100);
  drawTree(200);
  drawTree(600);
  
  drawCloud(screenWidth / 3, 200, 150, 100);
  drawCloud(screenWidth / 4, 50, 250, 100);
}

void drawTree(float xPosition)
{
  fill(100, 100, 100);
  rect(xPosition, 300, 50, 300);
  
  fill(0, 255, 100);
  ellipse(xPosition + 25, 300, 200, 200);
  
}

void drawCloud(float xPosition, float yPosition, float cloudWidth, float cloudHeight)
{
  fill(255, 255, 255); 
  ellipse(xPosition, yPosition, cloudWidth, cloudHeight);
}
