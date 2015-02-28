
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
  frameRate(60);
  radius = 20;
  ballX = width/2;
  ballY = height/2;
  xSpeed = 1;
  ySpeed = 1;
}

void draw()
{
  fill (0, 0, 0);
  textSize(20);
  textAlign(CENTER);
  text ("CLICK THE LETTER D, F, B, or S!", width/2, height/3);
  // Dubstep Stuff
  if (key == 'd')
  {
    text( "CLICK SPACE TO CLEAR", width/2, height/3.5);
    fill( 255, 255, 255);
    fill( random(255), random(255), random (255));
    textSize( 48);
    textAlign (CENTER);
    text( "|} µ B § † Σ ¶", mouseX, mouseY );
  }

  fill (255, 255, 255, 30);
  rect ( 0, 0, width, height );


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
  if (key == 'f')
  {
    fill( random(255), random (255), random(255));
    ellipse(ballX*2, ballY*2, radius*2, radius*2);
  }
  if ( key == 's')
  {
    fill(random(255), random(255), random(255), 20);
    ellipse(ballX/2, ballY/2, radius*2, radius*2);
  }
  if (key == 'b')
  {
    fill(255, 255, 255, 20);
    ellipse(ballX/2, ballY/2, radius*2, radius*2);
    fill( 0, 0, 0, 100);
    ellipse(ballX*2, ballY*2, radius*2, radius*2);
  }

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;
  fill( random(255), random(255), random(255));
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


