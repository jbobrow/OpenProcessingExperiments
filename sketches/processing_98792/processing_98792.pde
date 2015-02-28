
float ballY;
float radius;
float ballSpeed;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

  radius = 25;
  ballSpeed = 5;
  ballY = 30;
}

void draw()
{ 
  background(255, 255, 255);
  
  fill(255, 0, 0);

  ballY = ballY + ballSpeed; 

  if (ballY >= height-radius)
  {
    ballY = height-radius;
    ballSpeed = ballSpeed * (-1);
  }

  if (ballY <= radius)
  {
    ballY = radius;
    ballSpeed = ballSpeed * (-1);
  }

  ellipse(width/2, ballY, radius*2, radius*2);

  println(ballY);
}
