
float radius;
float ballX;
float ballY;
float xSpeed;
float ySpeed;
float pballX;
float pballY;

void setup()
{
  size(1000, 1000);
  background(random(255),random(255),random(255));
  smooth();
  frameRate(45);
  radius = 20;
  ballX = width/2;
  ballY = height/2;
  xSpeed = 1;
  ySpeed = 1;
  pballX = 1;
  pballY = 1;
}

void draw()
{
  // background(random (255), random(255), random(255));
  //background(255);
  fill((255), (255), (255));

  // Is ball at the bottom?
  if (ballY >= height-radius )
  {
    ballY = height-radius;
    ySpeed = ySpeed * (-1) ;
  }

  // Is ball at the top?
  if (ballY <= radius )
  {
    ballY = radius;
    ySpeed = ySpeed * (-1) ;
  }

  // Is ball at the right edge?
  if (ballX >= width-radius )
  {
    ballX = width-radius;
    xSpeed = xSpeed * (-1) ;
  }

  // Is ball at the left edge?
  if (ballX <= radius )
  {
    ballX = radius;
    xSpeed = xSpeed * (-1) ;
  }

  pballX = ballX;
  pballY = ballY;
  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
  line (pballX, pballY, ballX, ballY);
  ellipse( ballX, ballY, 30, 30
 );
  
  println("x=" + ballX + " y=" + ballY);
}

void mouseDragged()
{
  ballX = mouseX;
  xSpeed = pmouseX - mouseX ;
  ballY = mouseY;
  ySpeed = pmouseY - mouseY ;
}
 

