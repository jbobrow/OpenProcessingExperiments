
float ballX;
float ballY;
float vx; // x velocity
float vy; // y velocity

void setup()
{
  size(1300, 745);
  background(237, 255, 0);
  // set initial position (in the middle of the screen)
  ballX = width / 2;
  ballY = height / 2;
  vx = 10;
  vy = 10;
  // ADD - set initial velocity
}

void draw()
{
  moveBall();
  drawBall();
}

void moveBall()
{
  // ADD - update the ball's position by adding it's velocity (both vx and vy)
  ballX += vx;
  ballY += vy;
  // check if the ball over the left or right edges of the screen
  if (ballX < 0 || ballX > width)
  {
    // ADD - bounce off the left or right side of the screen
    vx = -vx;
  }

  // check if the ball over the top or bottom edges of the screen
  if (ballY < 0 || ballY > height)
  {
    // ADD - bounce off the floor or ceiling
    vy = -vy;
  }
} 

void drawBall()
{
  int r = (int) random(50, 255);
  int g = (int) random(50, 255);
  int b = (int) random(50, 255);

  color(r, g, b);
  fill(r, g, b);
  ellipse(ballX, ballY, 30, 30);
}
