
float ballX = 100;
float ballY = 0;
float h = 100;

float speedY = 2;
float speedX = 0;

void setup()
{
  size(800, 800);
  smooth();
  noStroke();
  ellipseMode(CENTER);
}

void draw()
{
  background(0);
  fill(255);
  
  
  
  ellipse(ballX, ballY, h, h);
  triangle(ballX + 45, ballY - 25, ballX + 10, ballY - 50, ballX + 30, ballY - 70);
  triangle(ballX - 45, ballY - 25, ballX - 10, ballY - 50, ballX - 30, ballY - 70);
  fill(0);
  ellipse(ballX - 23, ballY - 20, 18, 10);
  ellipse(ballX + 23, ballY - 20, 18, 10);
  ellipse(ballX - 25, ballY + 20, 2, 2);
  ellipse(ballX - 29, ballY + 17, 2, 2);
  ellipse(ballX - 29, ballY + 23, 2, 2);
  ellipse(ballX + 25, ballY + 20, 2, 2);
  ellipse(ballX + 29, ballY + 17, 2, 2);
  ellipse(ballX + 29, ballY + 23, 2, 2);
 
  speedY = speedY + 0.5;
  
  ballY = ballY + speedY;
  
  ballX = ballX + speedX;
  
  if (ballY > height - h/2)
  {
    ballY = height - h/2;
    speedY = speedY * - 0.9;
  }
  
  else if (ballY <= 0)
  {
    speedY = -speedY;
  }
  
  if (ballX > width - h/2)
  {
    ballX = width - h/2;
    speedX = speedX * -0.9;
  }
  
  else if(ballX <= 0)
  {
  speedX = -speedX;
  }

  
  if(keyPressed)
  {
    
    if(key == 'd')
    {
      speedX = speedX + 1;
    }
    
    if(key == 'a')
    {
      speedX = speedX - 1;
    }
    
    if(key == 'w' && ballY >= 695)
      {
        speedY = speedY - 2;
      }
    
    if(key == 's')
    {
      speedY = speedY + 1;
    }
     
    
  }
}


