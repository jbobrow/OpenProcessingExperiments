
float radius; 
float ballY; 
float ySpeed; 


void setup() { 
  size(400, 600); 
  background(255, 255, 255); 
  smooth(); 
  frameRate(60); 


 
 
  // initialize the variables:
   radius = 20; 
  ballY = radius; 
  ySpeed = 1;
 } 


void draw() { 
  background(255, 255, 255); 
  fill(255, 0, 0); 


  // If ball is at the bottom: 
  if (ballY >= height-radius ) 
  { 
    ballY = height-radius; 
    ySpeed = ySpeed * (-1) ;
   } 


  // If ball is at the top: 
  if (ballY <= radius ) 
  { 
    ballY = radius; 
    ySpeed = ySpeed * (-1) ;
   } 

  ballY = ballY + ySpeed; 
  ellipse( width/2, ballY, radius*2, radius*2 ); 
  println(ballY);
 

}
 


