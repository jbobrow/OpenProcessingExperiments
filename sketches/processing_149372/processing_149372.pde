
float xSpeed = 10;
float ySpeed = 2;
float xPosition = 250;
float yPosition = 1;

float ballWidth = 40;
float ballHeight = 40;
float rectWidth = 100;
float rectHeight = 10;
void setup()
{
  background(0,0,0);
  size(600,400);
  smooth();
}

void draw()
{
  
  background(0);
  fill(255,255,255);
  ellipse(xPosition,yPosition, ballWidth, ballHeight);
  rect(mouseX-50,350,rectWidth,rectHeight);
  
  ySpeed +=.25;
  xSpeed *=1;
  xPosition += xSpeed;
  yPosition += ySpeed;

  if (xPosition > width-rectWidth/2)
  {
    xPosition=width-rectWidth/2;
    xSpeed=-xSpeed;
  }
 

  if (xPosition<rectWidth)
  {
    xPosition=rectWidth;   
    xSpeed=-xSpeed;
  }
 
  if (yPosition > 350-ballHeight/2)
  {
    yPosition=350-ballHeight/2;
    ySpeed = -ySpeed*.9;
  }
 
  if (yPosition > 350-ballHeight/2-1)
  {
    xSpeed *=.9975;
  }
}

void keyPressed()
{
  xPosition = random(600);
  yPosition = 10;
  xSpeed = random(-15,15);
  ySpeed = 2;
}
  
