
float ballY;
float ballX;
float ySpeed;
float xSpeed;
float radius;
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth(); 
  frameRate(60);
    radius=20;
    ballY=height/2;
    ballX=width/2;
    ySpeed=20;
    xSpeed=20;
} 


void draw() 
{ 
background(255, 255, 255); 
  fill(0, 0, 0); 


 





    fill(random(255), random(255), random(255));
    triangle(0, height, width/2, 0, width, height);
    fill(random(255), random(255), random(255));
    triangle(10, height, width/2, 25, 390, height);
    fill(random(255), random(255), random(255));
    triangle(20, height, width/2, 50, 380, height);
    fill(random(255), random(255), random(255));
    triangle(30, height, width/2, 75, 370, height);
    fill(random(255), random(255), random(255));
    triangle(40, height, width/2, 100, 360, height);
    fill(random(255), random(255), random(255));
    triangle(50, height, width/2, 125, 350, height);
    fill(random(255), random(255), random(255));
    triangle(60, height, width/2, 150, 340, height);
    fill(random(255), random(255), random(255));
    triangle(70, height, width/2, 175, 330, height);

    fill(random(255), random(255), random(255));
    triangle(80, height, width/2, 200, 320, height);
    fill(random(255), random(255), random(255));
    triangle(90, height, width/2, 225, 310, height);
    fill(random(255), random(255), random(255));
    triangle(100, height, width/2, 250, 300, height);
    fill(random(255), random(255), random(255));
    triangle(110, height, width/2, 275, 290, height);
    fill(random(255), random(255), random(255));
    triangle(120, height, width/2, 300, 280, height);
    fill(random(255), random(255), random(255));
    triangle(130, height, width/2, 325, 270, height);
    fill(random(255), random(255), random(255));
    triangle(140, height, width/2, 350, 260, height);
    fill(random(255), random(255), random(255));
    triangle(150, height, width/2, 375, 250, height);

    fill(random(255), random(255), random(255));
    triangle(160, height, width/2, 400, 240, height);
    fill(random(255), random(255), random(255));
    triangle(170, height, width/2, 425, 230, height);
    fill(random(255), random(255), random(255));
    triangle(180, height, width/2, 450, 220, height);
    fill(random(255), random(255), random(255));
    triangle(190, height, width/2, 475, 210, height);

    fill(random(255), random(255), random(255));
    triangle(200, height, width/2, 500, 200, height);

    fill(random(255), random(255), random(255));
    triangle(width, 0, width/2, 300, width, height);
    fill(random(255), random(255), random(255));
    triangle(width, 10, 210, 300, width, 590);
    fill(random(255), random(255), random(255));
    triangle(width, 20, 220, 300, width, 580);
    fill(random(255), random(255), random(255));
    triangle(width, 10, 230, 300, width, 570);
    fill(random(255), random(255), random(255));
    triangle(width, 30, 240, 300, width, 560);

    fill(random(255), random(255), random(255));
    triangle(width, 40, 250, 300, width, 550);
    fill(random(255), random(255), random(255));
    triangle(width, 50, 260, 300, width, 540);
    fill(random(255), random(255), random(255));
    triangle(width, 60, 270, 300, width, 530);
    fill(random(255), random(255), random(255));
    triangle(width, 70, 280, 300, width, 520);

    fill(random(255), random(255), random(255));
    triangle(width, 80, 290, 300, width, 510);
    fill(random(255), random(255), random(255));
    triangle(width, 90, 300, 300, width, 500);
    fill(random(255), random(255), random(255));
    triangle(width, 100, 310, 300, width, 490);
    fill(random(255), random(255), random(255));
    triangle(width, 110, 320, 300, width, 480);

    fill(random(255), random(255), random(255));
    triangle(width, 120, 330, 300, width, 470);
    fill(random(255), random(255), random(255));
    triangle(width, 130, 340, 300, width, 460);
    fill(random(255), random(255), random(255));
    triangle(width, 140, 350, 300, width, 450);
    fill(random(255), random(255), random(255));
    triangle(width, 150, 360, 300, width, 440);

    fill(random(255), random(255), random(255));
    triangle(width, 160, 370, 300, width, 430);
    fill(random(255), random(255), random(255));
    triangle(width, 170, 380, 300, width, 420);
    fill(random(255), random(255), random(255));
    triangle(width, 180, 390, 300, width, 410);

    fill(random(255), random(255), random(255));
    triangle(0, 0, 200, height/2, 0, 600);
    fill(random(255), random(255), random(255));
    triangle(0, 10, 190, height/2, 0, 590);
    fill(random(255), random(255), random(255));
    triangle(0, 20, 180, height/2, 0, 580);
    fill(random(255), random(255), random(255));
    triangle(0, 30, 170, height/2, 0, 570);
    fill(random(255), random(255), random(255));
    triangle(0, 40, 160, height/2, 0, 560);
    fill(random(255), random(255), random(255));
    triangle(0, 50, 150, height/2, 0, 550);
    fill(random(255), random(255), random(255));
    triangle(0, 60, 140, height/2, 0, 540);
    fill(random(255), random(255), random(255));
    triangle(0, 70, 130, height/2, 0, 530);

    fill(random(255), random(255), random(255));
    triangle(0, 80, 120, height/2, 0, 520);
    fill(random(255), random(255), random(255));
    triangle(0, 90, 110, height/2, 0, 510);
    fill(random(255), random(255), random(255));
    triangle(0, 100, 100, height/2, 0, 500);
    fill(random(255), random(255), random(255));
    triangle(0, 110, 90, height/2, 0, 490);
    fill(random(255), random(255), random(255));
    triangle(0, 120, 80, height/2, 0, 480);
    fill(random(255), random(255), random(255));
    triangle(0, 130, 70, height/2, 0, 470);
    fill(random(255), random(255), random(255));
    triangle(0, 140, 60, height/2, 0, 460);
    fill(random(255), random(255), random(255));
    triangle(0, 150, 50, height/2, 0, 450);

    fill(random(255), random(255), random(255));
    triangle(0, 160, 40, height/2, 0, 440);
    fill(random(255), random(255), random(255));
    triangle(0, 170, 30, height/2, 0, 430);
    fill(random(255), random(255), random(255));
    triangle(0, 180, 20, height/2, 0, 420);
    fill(random(255), random(255), random(255));
    triangle(0, 190, 10, height/2, 0, 410);
    
     fill(random(255), random(255), random(255));
    triangle(0, 0, width/2, height/2, width, 0);
    fill(random(255), random(255), random(255));
    triangle(10, 0, width/2, 285, 390, 0);
    fill(random(255), random(255), random(255));
    triangle(20, 0, width/2, 270, 380, 0);
    fill(random(255), random(255), random(255));
    triangle(30, 0, width/2, 255, 370, 0);
    fill(random(255), random(255),random(255));
    triangle(40, 0, width/2, 240, 360, 0);
    fill(random(255), random(255), random(255));
    triangle(50, 0, width/2, 225, 350, 0);
    fill(random(255), random(255), random(255));
    triangle(60, 0, width/2, 210, 340, 0);
    fill(random(255), random(255), random(255));
    triangle(70, 0, width/2, 195, 330,0);
    
     fill(random(255), random(255), random(255));
    triangle(80, 0, width/2, 180, 320, 0);
    fill(random(255), random(255), random(255));
    triangle(90, 0, width/2, 165, 310, 0);
    fill(random(255), random(255), random(255));
    triangle(100, 0, width/2, 150, 300, 0);
    fill(random(255), random(255), random(255));
    triangle(110, 0, width/2, 135, 290, 0);
    fill(random(255), random(255), random(255));
    triangle(120, 0, width/2, 120, 280, 0);
    
     fill(random(255), random(255), random(255));
    triangle(130, 0, width/2, 105, 270, 0);
    fill(random(255), random(255), random(255));
    triangle(140, 0, width/2, 90, 260, 0);
    fill(random(255), random(255), random(255));
    triangle(150, 0, width/2, 75, 250, 0);
    fill(random(255), random(255), random(255));
    triangle(160, 0, width/2, 60, 240, 0);
    fill(random(255), random(255), random(255));
    triangle(170, 0, width/2,45, 230, 0);
    fill(random(255), random(255), random(255));
    triangle(180, 0, width/2, 30, 220, 0);
    fill(random(255), random(255), random(255));
    triangle(190, 0, width/2, 15, 210, 0);
     fill(random(255), random(255), random(255));
    triangle(190, 0, width/2, 0, 210, 0);
    
   
    
      fill(0, 0, 0); 


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
  fill(0,0,0);
  ellipse(ballY,ballX,radius*8,radius*8);
  fill(0,0,255);
  ellipse(ballY,ballX,radius*6,radius*6);
  fill(0,0,0);
  ellipse(ballY,ballX,radius*4,radius*4);
  fill(0,0,255);
  ellipse(ballY,ballX,radius*2,radius*2);
 fill(0,0,0); 
  ellipse( ballX, ballY, radius*8, radius*8 ); 
  fill(255,0,0);
  ellipse(ballX,ballY,radius*6,radius*6 );
 fill(0,0,0);
  ellipse(ballX,ballY,radius*4,radius*4);
  fill(255,0,0);
  ellipse(ballX,ballY,radius*2,radius*2);
  strokeWeight(2);
  fill(random(255),random(255),random(255));
  ellipse(ballX,ballX,radius*3,radius*3);
  fill(0,0,0);
  ellipse(ballX,ballX,radius,radius);
  fill(ballX,ballY,mouseY);
  ellipse(mouseX,mouseY,radius*4,radius*4);
  ellipse(mouseY,mouseX,radius*4,radius*4);
  fill(random(255),0,random(255));
  triangle(ballX,ballY,width/2,height/2,ballY,ballX);
  fill(random(100),random(100),random(100));
  ellipse(mouseX,mouseY,radius*6,radius*6);
  fill(0,0,0);
  textSize(72);
  //textSize(mouseY/5);
  text("☻",pmouseX-30,pmouseY+25);
  println("x=" + ballX + " y=" + ballY);
  }
