
float ballY;
float ballX;
float ySpeed;
float xSpeed;
float radius;
void setup()
{
  size(800, 1000);
  background(255, 255, 255);
  smooth();
  radius=20;
  ballY=height/2;
  ballX=width/2;
  ySpeed=20;
  xSpeed=20;
}
void draw()
{
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 800, 800);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 750, 750);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 700, 700);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 650, 650);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 600, 600);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 550, 550);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 500, 500);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 450, 450);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 400, 400);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 350, 350);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 300, 300);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 250, 250);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 200, 200);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 150, 150);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 100, 100);
  fill(random(255), random(255), random(255));
  ellipse(width/2, height/2, 50, 50);
  fill(0, 0, 0);
  ellipse(width/2, height/2, 25, 25);
  //fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 800, 800);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 750, 750);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 700, 700);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 650, 650);
  // triangle(width/2, height/2, frameCount, frameCount, 600, 600);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 550, 550);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 500, 500);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 450, 450);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 400, 400);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 350, 350);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 300, 300);
  //  fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 250, 250);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 200, 200);
  // fill(random(255), random(255), random(255));
  //triangle(width/2, height/2, frameCount, frameCount, 150, 150);
  //fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 100, 100);
  // fill(random(255), random(255), random(255));
  // triangle(width/2, height/2, frameCount, frameCount, 50, 50);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 800, 800);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 750, 750);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 700, 700);
  //  fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 650, 650);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 600, 600);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 550, 550);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 500, 500);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 450, 450);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 400, 400);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 350, 350);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 300, 300);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 250, 250);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 200, 200);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 150, 150);
  // fill(random(255), random(255), random(255));
  // rect(width/2, height/2, 100, 100);
  //fill(random(255), random(255), random(255));
  //rect(width/2, height/2, 50, 50);
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
  strokeWeight(5);
  fill(0,0,0);
  ellipse(ballX,ballY,radius*2,radius*2);
  ellipse(ballX-50,ballY-50,radius*3,radius*3);
  fill(0,0,0);
  ellipse(ballY,ballX,radius*2,radius*2);
  fill(0,0,0);
  ellipse(ballY-50,ballX-50,radius*3,radius*3);
  //ellipse(frameCount,frameCount,radius*3,radius*3);
}


