
float xSpeed = 3;
float ySpeed = 1;
float xPosition = mouseX;
float yPosition = mouseY;
float diameter = 50;
float background = 30;
 
void setup()
{
  size(800, 600);
  background(background);
}

void mousePressed()
{
  xPosition = mouseX;
  yPosition = mouseY;
}

void mouseDragged()
{
  xSpeed = mouseX-pmouseX;
  ySpeed = mouseY-pmouseY;
}

void draw()
{
  fill(background);
  rect(0, 0,width, height);
  
  fill(3, 245, 5);
  noStroke();
  ellipse(xPosition, yPosition, diameter, diameter);
 
  ySpeed +=1;
  xSpeed *=.99;
  xPosition += xSpeed;
  yPosition += ySpeed;
  
  // gravity bouncing
  if (yPosition > height-diameter/2)
  {
    yPosition=height-diameter/2;
    ySpeed = -ySpeed*.9;
  }
  
  //bounce ceiling
  if (yPosition < diameter/2)
  {
    yPosition=diameter/2;
    ySpeed = -ySpeed;
  }
  
  //bounce wall right
  if (xPosition > width-diameter/2)
  {
    xPosition=width-diameter/2;
    xSpeed = -xSpeed;
  }
  
  //bounce wall left
  if (xPosition < diameter/2)
  {
    xPosition=diameter/2;
    xSpeed = -xSpeed;
  }
  
}




