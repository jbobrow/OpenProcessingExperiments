
int ballW = 16;
int ballH = 16;
float ballXPos = 0;
float ballYPos = 0;
float ballYSpeed = 0;
float ballXSpeed = 0;
void setup()
{
  size(500,500);
  ballXPos = random(0, width);
}
void draw()
{
  background(127);
  fill(255,0,0);
  ellipse(ballXPos, ballYPos, ballW, ballH);
  ballXPos += ballXSpeed;
  ballYPos += ballYSpeed;
  ballYSpeed += 1;
  ballXSpeed += 1;
  if (ballYPos > height){
    ballYPos = height;
    ballYSpeed = -random(4,30);
  }
  if (ballXPos > width){
    ballXPos = width;
    ballXSpeed = -random(4,30);
  }
}

