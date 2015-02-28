
void setup()
{
  size(800, 800);
  
  // set initial position (in the middle of the screen)
  ballX = width / 2;
  ballY = height / 2;
  
  // ADD - set initial velocity
  vx = 2;
  vy = 125;
}

void draw()
{
  
  ballX +=vx;
  ballY +=vy;
  moveBall();
  drawBall();
}

void moveBall()
{
  // ADD - update the ball's position by adding it's velocity (both vx and vy)
  
  // check if the ball over the left or right edges of the screen
  if (ballX < 0 || ballX > width)
  {
     vx=-vx;
     // ADD - bounce off the left or right side of the screen
  }
  
  // check if the ball over the top or bottom edges of the screen
  if (ballY < 0 || ballY > height)
  {
   
    vy=-vy;
    // ADD - bounce off the floor or ceiling
  }
}

void drawBall()
{
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  triangle(ballX, ballY, 30, 30, 100, 150);
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(ballX, ballY, 50, 50);
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(ballX, ballY, 30, 30);
  fill(0);
   ellipse(ballX, ballY, 10, 10);
if (keyPressed && key == 's')
  {
    background(255, 255, 255);
  }
}
