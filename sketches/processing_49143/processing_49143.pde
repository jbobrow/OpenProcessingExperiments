
float xSpeed = 5;
float ySpeed = 1;
float xPosition = 50;
float yPosition = 50;
 
 
float ballWidth = 40;
float ballHeight = 40;
 
 
void setup()
{
 
  size(600, 400);
  background(255);
  smooth();
}
 
void draw()
{ 
  text( "Basketball",200,50);
  textSize(50);
  line(600,100,500,100);
  fill(255,150);
  rect(0, 0,
  width, height);
 
  fill(255, 100, 0);
  ellipse(xPosition, yPosition, 50, 50);
 
  ySpeed +=1;
  xSpeed *=.9975;
  xPosition += xSpeed;
  yPosition += ySpeed;
 
// chaning directions after hitting the right wall
  if (xPosition > width-ballWidth/2)
  {
    xPosition=width-ballWidth/2;
    xSpeed=-xSpeed;
  }
 
// changing directions after hitting the left wall
  if (xPosition<ballWidth/2)
  {
    xPosition=ballWidth/2;   
    xSpeed=-xSpeed;
  }
 
// loosing height after each bounce
  if (yPosition > height-ballHeight/2)
  {
    yPosition=height-ballHeight/2;
    ySpeed = -ySpeed*.9;
  }
 
// slow the ball down faster when it is rolling.
  if (yPosition > height-ballHeight/2-1)
  {
    xSpeed *=.9975;
  }
}
 
// re-throw the ball
void mouseDragged()
{
  xPosition = mouseX;
  yPosition = mouseY;
  xSpeed = mouseX - pmouseX;
  ySpeed = mouseY - pmouseY;
}

