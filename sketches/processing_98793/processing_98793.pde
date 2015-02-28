
float ballX;
float ballY;
float radius;
float ballSpeedX;
float ballSpeedY;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

  radius = 25;
  ballSpeedX = 5;
  ballSpeedY = 5;
  ballX = 30;
  ballY = 30;
}

void draw()
{ 
  background(255, 255, 255);
  
  fill(255, 0, 0);

  ballX = ballX + ballSpeedX; 
  ballY = ballY + ballSpeedY; 

  if (ballX >= width-radius)
  {
    ballX = width-radius;
    ballSpeedX = ballSpeedX * (-1);
  }

  if (ballX <= radius)
  {
    ballX = radius;
    ballSpeedX = ballSpeedX * (-1);
  }


  if (ballY >= height-radius)
  {
    ballY = height-radius;
    ballSpeedY = ballSpeedY * (-1);
  }

  if (ballY <= radius)
  {
    ballY = radius;
    ballSpeedY = ballSpeedY * (-1);
  }

  ellipse(ballX, ballY, radius*2, radius*2);

  println("x: " + ballX + ", y: " + ballY);
}
