
float radius; 
float ballY;
float ballX;
float xSpeed;
float ySpeed;
void setup()
{
  size(400, 400);

  strokeWeight(4);
  rectMode(CENTER);
  frameRate(30);
  radius = 40; 
  ballX = width/2; 
  ballY = height/2; 
  xSpeed = 1; 
  ySpeed = 1;
}
void draw()
{
  background(random(255), random(255), random(255));
  fill(random(255), random(255), random(255));
  rect(25, 25, 50, 50);
  rect(25+100, 25, 50, 50);
  rect(25+200, 25, 50, 50);
  rect(25+300, 25, 50, 50);


  fill(random(255), random(255), random(255));
  rect(75, 75, 50, 50);
  rect(75+100, 75, 50, 50);
  rect(75+200, 75, 50, 50);
  rect(75+300, 75, 50, 50);


  fill(random(255), random(255), random(255));
  rect(25, 25+100, 50, 50);
  rect(25+100, 25+100, 50, 50);
  rect(25+200, 25+100, 50, 50);
  rect(25+300, 25+100, 50, 50);


  fill(random(255), random(255), random(255));
  rect(75, 175, 50, 50);
  rect(75+100, 175, 50, 50);
  rect(75+200, 175, 50, 50);
  rect(75+300, 175, 50, 50);


  fill(random(255), random(255), random(255));
  rect(25, 25+200, 50, 50);
  rect(25+100, 25+200, 50, 50);
  rect(25+200, 25+200, 50, 50);
  rect(25+300, 25+200, 50, 50);


  fill(random(255), random(255), random(255));
  rect(75, 175+100, 50, 50);
  rect(75+100, 175+100, 50, 50);
  rect(75+200, 175+100, 50, 50);
  rect(75+300, 175+100, 50, 50);


  fill(random(255), random(255), random(255));
  rect(25, 25+300, 50, 50);
  rect(25+100, 25+300, 50, 50);
  rect(25+200, 25+300, 50, 50);
  rect(25+300, 25+300, 50, 50);


  fill(random(255), random(255), random(255));
  rect(75, 175+200, 50, 50);
  rect(75+100, 175+200, 50, 50);
  rect(75+200, 175+200, 50, 50);
  rect(75+300, 175+200, 50, 50);
  fill(255,0,0);



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


