
int shooterX, shooterY;
int alienX, alienY;
int speed;
int shapeSize = 30;

void setup()
{
  size(400, 400);
  shooterY = height - 30;
  alienX = 0;
  speed = 1;
  alienY = height/2;
}

void draw()
{
  background(0);
  
  //drawing shooter
  stroke(0);
  strokeWeight(0);
  shooterX = mouseX;
  rect(shooterX, shooterY, shapeSize, shapeSize);
  
  //drawing alien
  rect(alienX, alienY, shapeSize, shapeSize);
  alienX += speed;
  if (alienX + shapeSize > width || alienX < 0)
    speed = - speed;
}

void mousePressed()
{
  stroke(255, 0, 0);
  strokeWeight(5);
  line(shooterX+shapeSize/2, shooterY, shooterX+shapeSize/2, 0);
}
