
float radius;
float ballX;
float ballY;
float xSpeed;
float ySpeed;

void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  frameRate(60);
  radius = 20;
  ballX = width/2;
  ballY = height/2;
  xSpeed = 4;
  ySpeed = 4;
}

void draw()
{
  fill(random(45),random(144),random(143),random(120));

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

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
  ellipse( ballX, ballY, radius*2, radius*2 );
  println("x=" + ballX + " y=" + ballY);
}

void mouseDragged()
{
  ballX = mouseX;
  xSpeed = mouseX - pmouseX ;

  ballY = mouseY;
  ySpeed = mouseY - pmouseY ;
}

