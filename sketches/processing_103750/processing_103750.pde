
float ballX;
float ballY;
float vx; // x velocity
float vy; // y velocity

void setup()
{
  size(800, 800);
  
  // set initial position (in the middle of the screen)
  ballX = width / 2;
  ballY = height / 2;
  vx = -4;
  vy = 3;
  // ADD - set initial velocity
  //noStroke();
}

void draw()
{
  
  moveBall();
  drawBall();
}

void moveBall()
{
  ballX += vx;
  ballY += vy;
  
  // ADD - update the ball's position by adding it's velocity (both vx and vy)
  
  // check if the ball over the left or right edges of the screen
  if (ballX < 0 || ballX > width)
  {
    vx = -vx;
               // ADD - bounce off the left or right side of the screen
  }
  
  // check if the ball over the top or bottom edges of the screen
  if (ballY < 0 || ballY > height)
  {
   vy = -vy; // ADD - bounce off the floor or ceiling
  }
}

void drawBall()
{
 int r = (int) random(75, 255);
 int g = (int) random(75, 255);
 int b = (int) random(75, 255);
 
  
  fill(r, g, b);
  ellipse(ballX, ballY, 30, 30);
}
