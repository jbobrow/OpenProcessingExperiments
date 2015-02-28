
int myDiameter = 20;
int antiDiameter = 480;
boolean growing = true;
int maxSize = 500;
int minSize = 20;
int centerX = 250;
int centerY = 250;
float bkgColor = 0;
int antiX = 0;
int antiY = 0;
float alphaChannel = 100;
float redChannel = 255;
float greenChannel = 255;
float blueChannel = 255;
int SizeX = 800;
int SizeY = 800;
  
void setup()
{
    
  size(800, 800);
  smooth();
  noStroke();
 frameRate(30);
 background(0);
 maxSize = (250);
 centerX = SizeX/2;
 centerY = SizeY/2;
}
  
void draw()
{
  if(frameCount%2 == 0)
  {
    bkgColor = random(255);
  }
  fill(0,0,0,10);
  rect(0,0,width,height);
  stroke(bkgColor);
  fill(redChannel, greenChannel, blueChannel, alphaChannel);
  ellipse(centerX, centerY, myDiameter, myDiameter);
  ellipse(antiX, antiY, antiDiameter, antiDiameter);
  ellipse(mouseX,mouseY, abs(mouseX-pmouseX), abs(mouseY-pmouseY));
  if (myDiameter > maxSize)
  {
    growing = false;
    redChannel = random(255);
    blueChannel = random(255);
    greenChannel = random(255);
    alphaChannel = random(100);
    centerX = (int)random(0, SizeX);
    centerY = (int)random(0, SizeY);
    antiX = (int)random(0, SizeX);
    antiY = (int)random(0, SizeY);
  }
  else if (myDiameter < minSize)
  {
    growing = true;
    redChannel = random(255);
    blueChannel = random(255);
    greenChannel = random(255);
    alphaChannel = random(100);
    centerX = (int)random(0, SizeX);
    centerY = (int)random(0, SizeY);
    antiX = (int)random(0, SizeX);
    antiY = (int)random(0, SizeY);
  }
  if (growing == true)
  {
    myDiameter+= 20;
    antiDiameter -= 20;
  }
  else
  {
    myDiameter-=20;
    antiDiameter += 20;
  }
}                                                                                                           
