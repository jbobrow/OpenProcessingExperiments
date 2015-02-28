
float xSpeed = 5;
float ySpeed = 1;
float xPosition = 50;
float yPosition = 50;
 
 
float ballWidth = 100;
float ballHeight = 100;

PImage basketball;


void setup()
{
  size (650, 550);
  smooth();
  basketball=loadImage("new_wilson.ncaa.basketball.png");
  imageMode(CENTER);
}


void draw()
{
  background(255,211,100);
  smooth();
  noStroke();

  image(basketball, xPosition, yPosition, ballWidth, ballHeight);
   ySpeed +=1;
  xSpeed *=.9975;
  xPosition += xSpeed;
  yPosition += ySpeed;
 // changing directions after hitting the right wall
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
void mouseDragged()
{
  xPosition = mouseX;
  yPosition = mouseY;
  xSpeed = mouseX - pmouseX;
  ySpeed = mouseY - pmouseY;
}




