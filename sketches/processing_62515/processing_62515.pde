
float radius;
float ballX;
float ballY;
float xSpeed;
float ySpeed;

void setup()
{
  size(400, 600);
  background(89,96,132);
  smooth();
  frameRate(60);
  radius = 20;
  ballX = width/2;
  ballY = height/2;
  xSpeed = 1;
  ySpeed = 1;
}

void draw()
{
  background(89,96,132);
  fill(255, 0, 0);

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

fill(200,  155, 178);

  // Is ball at the bottom?
  if (ballX >= height-radius )
  {
    ballX = height-radius;
    ySpeed = ySpeed * (-1) ;
  }

  // Is ball at the top?
  if (ballX <= radius )
  {
    ballX = radius;
    ySpeed = ySpeed * (-1) ;
  }

  // Is ball at the right edge?
  if (ballY >= width-radius )
  {
    ballY = width-radius;
    xSpeed = xSpeed * (-1) ;
  }

  // Is ball at the left edge?
  if (ballY <= radius )
  {
    ballY = radius;
    ySpeed = ySpeed * (-1) ;
  }

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
  ellipse( ballY, ballX, radius*2, radius*2 );
  println("x=" + ballY + " y=" + ballX);
  
  if ( mouseX < width/2  && mouseX>width/4)
  {
    fill (0, 255, 0);
    ellipse  (  width/2, height/2, 100, 100 );
  if ( mouseX < width/2  && mouseX>width/4)
  fill (0,0,255);
 ellipse( 125, height/4, 155,155);
  if ( mouseX < width/2  && mouseX>width/4)
  fill (0,0,255);
  ellipse ( 270,height/4,155 ,155);
  if ( mouseX < width/2  && mouseX>width/4)
  strokeWeight(25); 
  line( 25,450, 375, 450); 
  
 
 
}
}
void mouseDragged()
{
  ballX = mouseX;
  xSpeed = mouseX - pmouseX ;

  ballY = mouseY;
  ySpeed = mouseY - pmouseY ;
}
