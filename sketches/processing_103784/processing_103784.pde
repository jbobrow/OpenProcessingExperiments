
float ballX;
float ballY;
float vx; // x velocity
float vy; // y velocity
int size = 30;

void setup()
{
  size(800, 800);
  
  // set initial position (in the middle of the screen)
  ballX = width / 2;
  ballY = height / 2;
  vx= 7;
  vy=8;
  
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
  
  // check if the ball over the left or right edges of the screen
  if (ballX < 0+size/2 || ballX > (width - size/2))
  {
    vx = -vx;
    // ADD - bounce off the left or right side of the screen
  }
  
  // check if the ball over the top or bottom edges of the screen
  if (ballY < 0+size/2 || ballY > (height-size/2))
  {
    vy = -vy;
    // ADD - bounce off the floor or ceiling
  }
  
  if(mousePressed)
  {
   vx = random(-10,10);
   vy= random(-10,10);
  }
}

void drawBall()
{
  int r = (int)random(100,255);
  int g = (int)random(100,255);
  int b = (int)random(100,255);
  
  ballX+= vx; 
  ballY+=vy;
  fill(r, g, b);
  ellipse(ballX, ballY, size, size);
}
