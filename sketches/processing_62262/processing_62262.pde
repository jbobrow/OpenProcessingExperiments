
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

  frameRate(10); 
  radius = 20; 
  ballX = width/2; 
  ballY = height/2; 
  xSpeed = 1; 
  ySpeed = 1;
} 

void draw() 
{ 
  background(255, 255, 255); 
  
  textSize(12);
  for (int x=0; x<width;x+=100)
  {
    for (int y=0;y<height;y+=50)
    {
      fill(random (255),random (255),random(255));
      text("seniorsrockok", x, y);
      
    }
  }

//  text("seniorsrockok", 200, 100);
//  text("seniorsrockok", 100, 100);
//  text("seniorsrockok", 200, 200);
//  text("seniorsrockok", 100, 200);
//  text("seniorsrockok", 250, 150);
//  text("seniorsrockok", 150, 150);

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
  if (ballX >= width-250 ) 
  { 
    ballX = width-250; 
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
  fill(random(255), random(255), random(255));
  textSize(48);
  text("Seniors '12", ballX, ballY); 
  println("x=" + ballX + " y=" + ballY);
} 

void mouseDragged() 
{ 
  ballX = mouseX; 
  xSpeed = mouseX - pmouseX ; 


  ballY = mouseY; 
  ySpeed = mouseY - pmouseY ;
}


