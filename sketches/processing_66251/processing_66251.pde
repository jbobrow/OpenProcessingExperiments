
int ballY;
boolean ballDown;

void setup()
{
  size(500, 500);
  ballY = 250;
  boolean ballDown = true;
}

void draw()
{
  ellipse(250, ballY, 50, 50);
  ballY +=1;
  
  if(ballY==500)
  {
    ballDown = false;
  }
  
  if(ballY==0)
  {
    ballDown = true;
  }
  
  if(ballDown = false)
  {
    ballY -=2;
  }
}


