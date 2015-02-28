
float ballY = 30;
float ballYSpeed = 30;
float ballX = 30;
float ballXSpeed = 30;

void setup()
{ 
  size(400, 600);
  background(0);
  smooth();
  frameRate(60);

} 
void draw() 
{  
  stroke(random(255), random(255), random(255));
  strokeWeight(random(10));
  fill(random(255), random(255), random(255));
  rect(ballX, ballY, random(75), random(75));
  
  if(ballY >= 600)
  {
   ballY = 600;
   ballYSpeed = -1 * ballYSpeed; 
  }
  
  if(ballY <= 0)
  {
    ballY = 0;
    ballYSpeed = -1 * ballYSpeed;
  }  
  
  if(ballX >= 375)
  {
   ballX = 375;
   ballXSpeed = -1 * ballXSpeed; 
  }
  
  if(ballX <= 0)
  {
    ballX = 0;
    ballXSpeed = -1 * ballXSpeed;
  }  
  
  ballX = ballX + ballXSpeed;
  ballY = ballY + ballYSpeed;
}

void mousePressed()
{
 background(random(255), random(255), random(255), random(255));
}
