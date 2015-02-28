
float xPos;
float yPos;
float vx;
float vy;

void setup()
{
  size(800, 800);
  
  size(800, 800);
  
  xPos = width / 2;
  yPos = width / 2;
  vx = -10;
  vy = 2;
  
}


void draw()
{
  background(255);
  
  float xPos = width/2;
  xPos += 2; // same as xPos = xPos + 2
  yPos += vy;
  
  
  fill(0);
  ellipse(xPos, yPos, 50, 50);
}


