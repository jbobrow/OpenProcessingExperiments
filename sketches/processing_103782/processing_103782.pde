
float xPos = 0;
float yPos = 0;

void setup()
{
  size(1920, 1080);
  //noStroke();
}

void drawCircle(float x, float y, float size, color circleColor)
{
  fill(circleColor);
  ellipse(x, y, size, size);
}


void drawRect(float x, float y, float size, color rectColor)
{
  fill(rectColor);
  rect(x, y, size, size);
}

void draw()
{
 xPos=mouseX;
 yPos=mouseY;
 
 {
   int r = (int) random(100,255);
   int g = (int) random(100,255);
   int b = (int) random(100,255);
   fill(r,g,b);
   ellipse(xPos, yPos,100,100);
 }
  
  
 for(int drawCircle = 0; drawCircle <= 192; drawCircle++)
 {
  int r = (int) random(100,255);
  int g = (int) random(100,255);
  int b = (int) random(100,255);
  fill(r,g,b);
  
  int xPos = (int) random(0,1920);
  int yPos = (int) random(0,1080);
  
  int circleSize = (int) random(1,50);
  
  drawCircle(xPos, yPos, circleSize, color(r, g, b));
 }
 
 for(int drawRect = 0; drawRect <= 192; drawRect++)
 {
  int r = (int) random(100,255);
  int g = (int) random(100,255);
  int b = (int) random(100,255);
  fill(r,g,b);
  
  int xPos = (int) random(0,1920);
  int yPos = (int) random(0,1080);
  
  int rectSize = (int) random(1,50);
  
  drawRect(xPos, yPos, rectSize, color(r, g, b));
 } 
}



