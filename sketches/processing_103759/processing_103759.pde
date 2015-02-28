
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
  
  vx = 15;
  vy = 10;
  
  noStroke();
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
  
  if (ballX < 0 || ballX > width)
  {
   // background(random(0, 255), random(0,255), random(0,255));
    fill(random(0, 255), random(0,255), random(0,255));
    vx = vx * -1;
  }
  
  // check if the ball over the top or bottom edges of the screen
  if (ballY < 0 || ballY > height)
  {
    //background(random(0, 255), random(0,255), random(0,255));
    fill(random(0, 255), random(0,255), random(0,255));
    vy = vy * -1;
  }
}

void drawBall()
{
  if(mousePressed)
  {
    rect(ballX, ballY, 40, 40);
  }
  else 
  {
    ellipse(ballX, ballY, 40, 40);
  }
}
