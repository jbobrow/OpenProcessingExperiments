
float ballY;
float radius;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
  
  radius = 20;
  
}

void draw()
{
  fill(255, 0, 0);

  ballY = ballY + 1;  
  
  if (ballY >= height-radius)
  {
    ballY = height-radius;
    noLoop();
  }
  
  ellipse(width/2, ballY, radius*2, radius*2);
  
  println(ballY);
  
}
