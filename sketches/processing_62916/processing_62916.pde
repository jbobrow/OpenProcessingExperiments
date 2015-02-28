

float radius;
float ballX;
float ballY;

float ball2X;
float ball2Y;

float ball3X;
float ball3Y;

float ball4X;
float ball4Y;

float xSpeed;
float ySpeed;

float xSpeed2;
float ySpeed2;

float xSpeed3;
float ySpeed3;

float xSpeed4;
float ySpeed4;


void setup()
{
  size(400, 600);
  frameRate(60);
  smooth();
  radius = 20 ;
  ballX = width/2 ;
  ballY = height/2 ;

  ballX = 300;
  ballY = 300 ;
  xSpeed = 5 ;
  ySpeed = 5 ;

  xSpeed2 = 3;
  ySpeed2 = 2;

  xSpeed3 = 4;
  ySpeed3 = 5;

  xSpeed4 = 2;
  ySpeed4 = 2;
}






void draw()
{

  fill( 0, 0, 255, 1 ) ;

  rect ( -1, -1, 700, 700 ) ;

  //ball1
  if (ballY >= height-radius )
  {
    ballY = height-radius;
    ySpeed = ySpeed * (-1) ;
  }

  if (ballY <= radius )
  {
    ballY = radius;
    ySpeed = ySpeed * (-1) ;
  }


  if (ballX >= width-radius )
  {
    ballX = width-radius;
    xSpeed = xSpeed * (-1) ;
  }


  if (ballX <= radius )
  {
    ballX = radius;
    xSpeed = xSpeed * (-1) ;
  }

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
  fill ( 0, 255, 0 ) ;
  ellipse( ballX, ballY, radius*2, radius*2 );



  //ball2
  if (ball2Y >= height-radius )
  {
    ball2Y = height-radius;
    ySpeed2 = ySpeed2 * (-1) ;
  }

  if (ball2Y <= radius )
  {
    ball2Y = radius;
    ySpeed2 = ySpeed2 * (-1) ;
  }


  if (ball2X >= width-radius )
  {
    ball2X = width-radius;
    xSpeed2 = xSpeed2 * (-1) ;
  }


  if (ball2X <= radius )
  {
    ball2X = radius;
    xSpeed2 = xSpeed2 * (-1) ;
  }

  ball2X = ball2X + xSpeed2;
  ball2Y = ball2Y + ySpeed2;
  ellipse( ball2X, ball2Y, radius*2, radius*2 );

  //ball3
  if (ball3Y >= height-radius )
  {
    ball3Y = height-radius;
    ySpeed3 = ySpeed3 * (-1) ;
  }

  if (ball3Y <= radius )
  {
    ball3Y = radius;
    ySpeed3 = ySpeed3 * (-1) ;
  }


  if (ball3X >= width-radius )
  {
    ball3X = width-radius;
    xSpeed3 = xSpeed3 * (-1) ;
  }


  if (ball3X <= radius )
  {
    ball3X = radius;
    xSpeed3 = xSpeed3 * (-1) ;
  }

  ball3X = ball3X + xSpeed3;
  ball3Y = ball3Y + ySpeed3;
  ellipse( ball3X, ball3Y, radius*2, radius*2 );


  //ball1
  fill ( 0, 0, 0, 0 ) ;

  if (ball4Y >= height-radius )
  {
    ball4Y = height-radius;
    ySpeed4 = ySpeed4 * (-1) ;
  }

  if (ball4Y <= radius )
  {
    ball4Y = radius;
    ySpeed4 = ySpeed4 * (-1) ;
  }


  if (ball4X >= width-radius )
  {
    ball4X = width-radius;
    xSpeed4 = xSpeed4 * (-1) ;
  }


  if (ball4X <= radius )
  {
    ball4X = radius;
    xSpeed4 = xSpeed4 * (-1) ;
  }

  if (keyCode==LEFT)
  {
    xSpeed4 = abs(xSpeed4)*-1;
  }

  if (keyCode==RIGHT)
  {
    xSpeed4 = abs(xSpeed4);
  }

  if (keyCode==UP)
  {
    ySpeed4 = abs(ySpeed4)*-1;
  }

  if (keyCode==DOWN)
  {
    ySpeed4 = abs(ySpeed4);
  }


  ball4X = ball4X + xSpeed4;
  ball4Y = ball4Y + ySpeed4;
  fill ( 0, 255, 0 ) ;
  ellipse( ball4X, ball4Y, radius*2, radius*2 );
}


void mouseDragged()
{
  ballX = mouseX;
  xSpeed = mouseX - pmouseX ;

  ballY = mouseY;
  ySpeed = mouseY - pmouseY ;
}

void mousePressed()
{
  fill( 255, 0, 0 );
  background( 0, 0, 0 );
  ellipse ( mouseX, mouseY, 50, 50 ) ;
}

void keyPressed()
{
  if (key==' ')
  {
    background( 0, 0, 0 ) ;
  }
}


