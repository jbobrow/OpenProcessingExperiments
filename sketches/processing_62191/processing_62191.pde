
//Sketch drawn by Mary Dekker :)
float radius; 
float ballX; 
float ballY; 
float xSpeed; 
float ySpeed;
void setup()
{
  size(500, 500);
  background(random(200), random(200), random(200));
  smooth();
  stroke(random(255), random(255), random(255));
  strokeWeight(5);
  frameRate(20);
  radius = 20; 
  ballX = width/2; 
  ballY = height/2; 
  xSpeed = 1; 
  ySpeed = 1;
}
void draw()
{
  ellipse(width/2, height/2, mouseX, mouseY);
  fill(random(120), random(50), random(175), 75);
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
  ellipse( ballX, ballY, radius*2, radius*2 ); 
  println("x=" + ballX + " y=" + ballY);
  fill( random(255), random(255), random(255) );
  ellipse( mouseX, mouseY, 50, 50 );
  strokeWeight(1);
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, mouseY, mouseY/2);
  line(mouseX, mouseY, width/2, height/2);
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
  background(random(200), random(200), random(200));
}


