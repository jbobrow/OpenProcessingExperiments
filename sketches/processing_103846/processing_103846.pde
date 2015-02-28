
float ballX;
float ballY;
float ballA;
float ballB;
float vx; // x velocity
float vy; // y velocity
float va;
float vb;
void setup()
{
  size(2000, 2000);
  
  // set initial position (in the middle of the screen)
  ballX = width / 2;
  ballY = height / 2;
  ballA = width /2;
  ballB = height /2;
  
  // ADD - set initial velocity
  vx = 2;
  vy = 125;
  va = 2;
  vb = 300;
}

void draw()
{
  
  ballX +=vx;
  ballY +=vy;
  moveBall();
  drawBall();
  ballA +=va;
  ballB +=vb;
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
  fill(0);
  triangle(ballX, ballY, 100, 100, 300, 250);
  fill(random(1, 255), random(1, 255), random(1, 255));
  triangle(ballX, ballY, 20, 20, 100, 150);
  fill(random(1, 255), random(1, 255), random(1, 255));
  ellipse(ballX, ballY, 150, 150);
  fill(0);
  ellipse(ballX, ballY, 125, 125);
  fill(random(1, 255), random(1, 255), random(1, 255));
  ellipse(ballX, ballY, 100, 100);
  fill(0);
  ellipse(ballX, ballY, 75, 75);
  fill(random(1, 255), random(1, 255), random(1, 255));
  ellipse(ballX, ballY, 50, 50);
  fill(random(1, 255), random(1, 255), random(1, 255));
  ellipse(ballX, ballY, 30, 30);
  fill(0);
   ellipse(ballX, ballY, 10, 10);
if (keyPressed && key == 's')

  {
    background(random(1, 255), random(1, 255), random(1, 255));
  }
   if(keyPressed && key == 'f')
   {
   background(0);  
   } 
 }
