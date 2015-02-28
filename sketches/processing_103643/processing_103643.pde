
int screenWidth = 1000;
int screenHeight = 800;


void setup ()
{
  size(screenWidth, screenHeight);
  background(143, 240, 234);
  
  float treeXPosition = screenWidth / 2.0;
  drawTree(treeXPosition + 250, 200, 450);
  drawTree(treeXPosition, 250, 400);
  drawTree(treeXPosition - 250, 175, 475);
  
  //grass
  fill(26, 160, 18);
  rect(0, 750, 1000, 50);
  
  drawCloud(500, 0, 300, 100);
  drawCloud(900, 20, 250, 110);
  drawCloud(700, 10, 350, 100);
  drawCloud(300, -10, 200, 110);
  
  //sun
  fill(251, 255, 49);
  ellipse(0, 0, 400, 400);
}
  
  
void drawTree(float xPosition, float yPosition, float treeHeight)
{
  fill(64, 37, 16);
  rect(xPosition, yPosition + 100, 100, treeHeight);

  fill(26, 160, 18);
  ellipse(xPosition + 50, yPosition, 300, 250);
}


void drawCloud(float xPosition, float yPosition, float cloudWidth, float cloudHeight)
{
  fill(201, 201, 201);
  ellipse(xPosition, yPosition, cloudWidth, cloudHeight);
}
