
float ballX;
float ballY;
float vx; // x velocity
float vy; // y velocity
int radius = 50;

void setup()
{
  size(800, 800);
  
  ballX = width / 2;
  ballY = height / 2;
  vx = random(-10, 10);
  vy = random(-10, 10);
  
}

void draw()
{
  moveBall();
  drawBall();
}

void moveBall()
{
  ballX = ballX + vx;
  ballY = ballY + vy;
  

  if (ballX < 0 || ballX > width)
  {
    vx = -vx;
  }
  if (ballY < 0 || ballY > height)
  {
    vy = -vy;
  }
}

void drawBall()
{
  int r = (int) random(100, 200);
  int g = (int) random(100, 200);
  int b = (int) random(100, 200);
  
  
  fill(r, g, b);
  ellipse(ballX, ballY, 30, 30);
  noStroke();
}
