
float radius;
float ballX;
float ballY;
float xSpeed;
float ySpeed;
void setup()
{
  size(400, 600);
  background(random(255), random(255), random(255) );
  smooth();
  frameRate(60);
  // initialize variables:
  ballX = width/2;
  ballY = height/2;
  radius = 25;
  xSpeed = 5;
  ySpeed = 5;
}

void draw()
{
  background(random(255), random(255), random(255) );
  fill(random(255), random(255), random(255) );
  ellipse(width/2, ballY, radius*6, radius*3 );
  ellipse(width/2, ballY, radius*3, radius*6 );
  ellipse(width/2, ballY, radius*1, radius*7 ); 
  ellipse(width/2, ballY, radius*7, radius*1 ); 

  //if ball is at bottom
  if ( ballY >= height-radius )
  {
    ballY= height-radius ;
    ySpeed = ySpeed * (-1);
  } 

  //if ball is at top  
  if ( ballY <= radius )
  {
    ballY= radius ;
    ySpeed = ySpeed * (-1);
  }  


  ellipse( width/2, ballY, radius*2, radius*2 );


  println( "ballY: " + ballY );

  ballY = ballY + ySpeed;


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

















