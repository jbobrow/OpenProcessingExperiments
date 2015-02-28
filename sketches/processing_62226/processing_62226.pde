

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
  xSpeed = 50; 
  ySpeed = 50
  ;
 } 

void draw() 
{ 
  background(random(255), 43,88); 
  fill(185,11,176); 
  image(loadImage("cheshire-cat-4.jpg"),width/2-100,height/2-100, 200,200);

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
 


