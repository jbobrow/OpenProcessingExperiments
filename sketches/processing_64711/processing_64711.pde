
//Gravity_Affected
//by Ryan Tabler
//26 June 2012
//Version 1.0

float xCoordInit = 20;
float yCoordInit = 20;
float xVelocInit = 20;
float yVelocInit = 0;
final float yAccel = 9.81;
float xTimeInit = 0;
float yTimeInit = 0;
float xCoord, yCoord,xVeloc,yVeloc,xTime,yTime;

float pointRadius = 20;
float backgroundValue = 255;
float strokeValue = 0;
int backgroundToggle = 0;

void setup()
{
  size(500,500);
  background(255);
  frameRate(1000);
  strokeWeight(2 * pointRadius);
  stroke(0);
}

void draw()
{
  yCoord = yVelocInit * yTime + 0.5 * yAccel * yTime * yTime + yCoordInit;
  yVeloc = yVelocInit + yAccel * yTime;
  
  xVeloc = xVelocInit;
  xCoord = xVeloc * xTime + xCoordInit;
  
  if (yCoord > height - pointRadius)
  {
    yTime = 0;
    //yCoord = width - (yCoord - width);
    yCoordInit = yCoord;
    yVelocInit = 0 - yVeloc;
  }
  
  if ((xCoord > width - pointRadius) || (xCoord < pointRadius))
  {
    xTime = 0;
    //xCoord = width - (xCoord - width);
    xCoordInit = xCoord;
    xVelocInit = -xVeloc;
  }
  
  background(backgroundValue);
  stroke(strokeValue);
  
  if (backgroundToggle == 0)
  {
    backgroundValue -= 0.1;
    strokeValue += 0.1;
  }
  
  if (backgroundToggle == 1)
  {
    backgroundValue += 0.1;
    strokeValue -= 0.1;
  }
  
  if ((backgroundValue <= 0) || (strokeValue >= 255))
  {
    backgroundToggle = 1;
  }
  if ((backgroundValue >= 255) || (strokeValue <= 0))
  {
    backgroundToggle = 0;
  }
    
  
  
  point(xCoord,yCoord);
  xTime += 0.05;
  yTime += 0.05;
}


