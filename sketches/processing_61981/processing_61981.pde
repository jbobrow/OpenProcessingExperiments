
float radius; 
float ballX; 
float ballY; 
float xSpeed; 
float ySpeed;

void setup() 
{ 
  size(1000, 900); 
  background(0,0,255); 
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
  background(0, 0, 255); 
  fill(165,93,22);
  rect(0,height-100,width,100);
  fill(255,255,255);
  ellipse(100,100,150,100);
   fill(255,255,255);
  ellipse(200,200,150,100);
   fill(255,255,255);
  ellipse(500,140,150,100);
    fill(255,255,255);
  ellipse(700,140,150,100);
  image(loadImage("hitler-baby.jpg"), 700,650);
  image(loadImage("osama-obit-420x0.jpg"), 50, 650);
  
  
  fill(255, 0, 0); 
  


  // Is ball at the bottom? 
  if (ballY >= height-100 ) 
  { 
   ballY = height-100; 
   ySpeed = ySpeed * (0) ;
   } 

  // Is ball at the top? 
  if (ballY <= radius ) 
  { 
   ballY = radius; 
   ySpeed = ySpeed * (0) ;
   } 

  // Is ball at the right edge? 
  if (ballX >= width-radius ) 
  { 
   ballX = width-radius; 
   xSpeed = xSpeed * (0) ;
   } 

  // Is ball at the left edge? 
  if (ballX <= radius ) 
  { 
   ballX = radius; 
   xSpeed = xSpeed * (0) ;
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
 
 
 


