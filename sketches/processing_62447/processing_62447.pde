
float radius;
float ballX;
float ballY;
float xSpeed;
float ySpeed;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(40);
  radius = 20;
  ballX = width/2;
  ballY = height/2;
  xSpeed = 1;
  ySpeed = 1;
}

void draw()
{
  background(random(255),random(255), random(255));
  fill(random(255),random(255) ,random(255) );

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
  ellipse( ballX, ballY,mouseX ,mouseY  );
  println("x=" + ballX + " y=" + ballY);
}

void mouseDragged()
{
  ballX = mouseX;
  xSpeed = mouseX - pmouseX ;

  ballY = mouseY;
  ySpeed = mouseY - pmouseY ;
}
