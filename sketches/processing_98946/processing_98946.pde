
int ballX;
int ballY;
int radius;
int ballSpeed;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
  
  ballX = width/2;
  ballY = height/2;
  radius = 25;
  ballSpeed = 5;
  
}

void draw()
{
  fill(255, 255, 255, 50);
  noStroke();
  rect(0, 0, width, height);
  
  fill(255, 0, 0);
  ellipse(ballX, ballY, radius*2, radius*2); 
}


void keyPressed()
{
  if ( (keyCode == LEFT) && (ballX > radius) )
  {
    ballX = ballX - ballSpeed;
  }

  if ( (keyCode == RIGHT) && (ballX < width-radius) )
  {
    ballX = ballX + ballSpeed;
  }

  if ( (keyCode == UP) && (ballY > radius) )
  {
    ballY = ballY - ballSpeed;
  }

  if ( (keyCode == DOWN) && (ballY < height-radius) )
  {
    ballY = ballY + ballSpeed;
  }


  
}
