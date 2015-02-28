
float radius; 
float ballX; 
float ballY; 
float xSpeed; 
float ySpeed; 

void setup() 
{ 
  size(400, 600); 
  background(random(255), random (255), random (255)); 
  smooth(); 
  frameRate(60); 
  radius = 10; 
  ballX = width/2; 
  ballY = height/2; 
  xSpeed = 5; 
  ySpeed = 5;
} 

void draw() 
{ 

  fill(255, 0, 0); 


  // Is ball at the bottom? 
  if (ballY >= height-radius ) 
  { 
    ballY = height-radius; 
    ySpeed = ySpeed * (-1) ;
    background (random (255), random (255), random (255));
  } 

  // Is ball at the top? 
  if (ballY <= radius ) 
  { 
    ballY = radius; 
    ySpeed = ySpeed * (-1) ;
    background (random (255), random (255), random (255));
  } 

  // Is ball at the right edge? 
  if (ballX >= width-radius-175 ) 
  { 
    ballX = width-radius-175; 
    xSpeed = xSpeed * (-1) ;
    background (random (255), random (255), random (255));
  } 

  // Is ball at the left edge? 
  if (ballX <= radius ) 
  { 

    ballX = radius; 
    xSpeed = xSpeed * (-1) ;
    background (random (255), random (255), random (255));
  } 

  ballX = ballX + xSpeed; 
  ballY = ballY + ySpeed;
  textSize(25); 
  text( "Marcus James", ballX, ballY); 
  println("x=" + ballX + " y=" + ballY);
} 

void mouseDragged() 
{ 
  ballX = mouseX; 
  xSpeed = mouseX - pmouseX ; 


  ballY = mouseY; 
  ySpeed = mouseY - pmouseY ;
}


