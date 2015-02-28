
float ballY = 30;
float ballYSpeed = 1;
float ballX = 30;
float ballXSpeed = 1;

void setup()
{
  size(400, 600);
  background(255);
  smooth();
  frameRate(60);
}

void draw()
{
  fill(random(255), random(255), random(255));
  ellipse(ballX, ballY, 50, 50); 

  if (ballY >= 575)
  {

    ballY = 575;
    ballYSpeed = random(-4, -1) * ballYSpeed;
  }  
  if (ballY <= random(25))
  {

    if (ballXSpeed < -25)
    {
      ballXSpeed = -1;
    }
    ballY = 25;
    ballYSpeed = -1 * ballYSpeed;
  }  
  if (ballX >= 375)
  {

    ballX = 375;
    ballXSpeed = random(-3, -1) * ballXSpeed;


    if (ballXSpeed < -25)
    {
      ballXSpeed = -1;
    }
  }  
  if (ballX <= 25)
  {

    ballX = 25;
    ballXSpeed = random(-5, -1) * ballXSpeed;
    if (ballXSpeed > 25)
    {
      ballXSpeed = 1;
    }
  }  

  ballY = ballY + ballYSpeed;
  ballX = ballX + ballXSpeed;
}
