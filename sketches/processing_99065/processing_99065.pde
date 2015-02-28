
float ballY = 30;
float ballYSpeed = 1;
float ballX = 30;
float ballXSpeed = 1;
float ballA = 30;
float ballASpeed = 1;
float ballZ = 175;
float ballZSpeed = 1;
float ballB = 575;
float ballBSpeed = 1;
float ballC = 30;
float ballCSpeed = 1;
float ballV = 350;
float ballVSpeed = 1;
float ballQ = 30;
float ballQSpeed = 1;
void setup()
{
  size(400, 600);
  background(255);
  smooth();
  frameRate(60);
}  

void draw()
{
  fill(random(255),random(255),random(255));
  ellipse(ballX, ballY,50,50);
  ellipse(ballZ,ballA,50,50);
  ellipse(ballB,ballC,50,50);
  ellipse(ballV,ballQ,50,50);
  if (ballY >= 575)
  {
    ballY = 575; 
    ballYSpeed = -ballYSpeed;
  }

  if (ballY <= 25)
  {
    ballY = 25; 
    ballYSpeed = -1 * ballYSpeed;
  }
  
   if (ballX >= 175)
  {
    ballX = 175; 
    ballXSpeed = -ballXSpeed;
  }

  if (ballX <= 25)
  {
    ballX = 25; 
    ballXSpeed = -1 * ballXSpeed;
  }
  
    if (ballA >= 575)
  {
    ballA = 575; 
    ballASpeed = -ballASpeed;
  }

  if (ballA <= 25)
  {
    ballA = 25; 
    ballASpeed = -1 * ballASpeed;
  }
  
   if (ballZ >= 375)
  {
    ballZ = 375; 
    ballZSpeed = -ballZSpeed;
  }

  if (ballZ <= 225)
  {
    ballZ = 225; 
    ballZSpeed = -1 * ballZSpeed;
  }
      if (ballB >= 375)
  {
    ballB = 375; 
    ballBSpeed = -ballBSpeed;
  }

  if (ballB <= 25)
  {
    ballB = 25; 
    ballBSpeed = -1 * ballBSpeed;
  }
  
   if (ballC >= 575)
  {
    ballC = 575; 
    ballCSpeed = -ballCSpeed;
  }

  if (ballC <= 25)
  {
    ballC = 25; 
    ballCSpeed = -1 * ballCSpeed;
  }
   if (ballQ >= 575)
  {
    ballQ = 575; 
    ballQSpeed = -ballQSpeed;
  }

  if (ballQ <= 25)
  {
    ballQ = 25; 
    ballQSpeed = -1 * ballQSpeed;
  }
  
   if (ballV >= 175)
  {
    ballV = 175; 
    ballVSpeed = -ballVSpeed;
  }

  if (ballV <= 25)
  {
    ballV = 25; 
    ballVSpeed = -1 * ballVSpeed;
  }
  
  ballX = ballX + ballXSpeed;

  ballY = ballY + ballYSpeed;
  
  ballA = ballA + ballASpeed;
  
  ballZ = ballZ + ballZSpeed;
  
  ballB = ballB + ballBSpeed;
  
  ballC = ballC + ballCSpeed;
  
  ballV = ballV + ballVSpeed;
  
  ballQ = ballQ + ballQSpeed;
}
