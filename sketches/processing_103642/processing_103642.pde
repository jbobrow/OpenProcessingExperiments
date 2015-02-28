
int screenWidth = 800;
int screenHeight = 600;

void setup ()
{
  size(screenWidth, screenHeight);
  
  float circleXPos = 200;
  drawConcentricCircles(circleXPos, 150, "I am a circle", 15);
  drawConcentricCircles(circleXPos, 350, "I wish I was a square", 20);
  
}

void drawConcentricCircles(float xPos, float yPos, String circleText, int textSize)
{
  fill(255, 255, 255);
  ellipse(xPos, yPos, 100, 100);
  ellipse(xPos, yPos, 50, 50);
  ellipse(xPos, yPos, 10, 10);
  
  fill(0, 0, 0);
  textSize(textSize);
  text(circleText, xPos + 60, yPos);

}
