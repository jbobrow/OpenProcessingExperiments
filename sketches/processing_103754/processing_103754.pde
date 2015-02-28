
float xPos = 0;
float yPos = 0;

void setup()
{
  size(1920, 1080);
  

 
}

void drawCircle(float x, float y, float size, color circleColor)
{
  fill(circleColor);
  ellipse(x, y, size, size);
}

void draw()
{
  xPos = mouseX;
  yPos = mouseY;
  
  if(mousePressed)
  
  {
    int r = (int) random(0, 100);
    int g = (int) random(0, 100);
    int b = (int) random(0, 100);
    
    fill(r, g, b);
    ellipse(xPos, yPos, 50, 50);
  }
  for(int loopCircles = 0; loopCircles <= 192; loopCircles++)
  {
    int r = (int) random(100, 255);
    int g = (int) random(100, 255);
    int b = (int) random(100, 255);
    
    int xPos = (int) random(0, 1920);
    int yPos = (int) random(0, 1080); 
    
    //noStroke();
    int circleSize = (int) random(1, 40);    
    drawCircle(xPos, yPos, circleSize, color(r, g, b));
  } 
  
}
