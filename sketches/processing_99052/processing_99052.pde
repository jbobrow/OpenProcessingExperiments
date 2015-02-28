
float ballY = 30;
float ballYSpeed = 1;
float ballX = 30;
float ballXSpeed = 1;
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(10000000);
}

void draw() 
{
  fill(random(255), random(255), random(255));
  ellipse(random(255), ballY, random(height), random(255));
  if (ballY >= 575)
  {
    ballY = 575;
    ballYSpeed = -1 * ballYSpeed;
  }


  if (ballY <= 25)
  {
    ballY = 25;
    ballYSpeed = -1 * ballYSpeed;
  }
  if (ballX >= 375)
  {
    ballX = 375;
    ballXSpeed = -1 * ballXSpeed;
  }


  if (ballX <= 25)
  {
    ballX = 25;
    ballXSpeed = -1 * ballXSpeed;
  }

  ballY = ballY + ballYSpeed;
}
