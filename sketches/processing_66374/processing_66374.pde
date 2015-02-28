
float ballX;
float ballY;
float speedX=10;
float speedY=7;
float d=20;
float gravity=0.3;

void setup(){
  size(400,400);
  smooth();
  noStroke();
   ballX=random(width);
  ballY=random(height);
 
}

void draw(){
  background(255);
  fill(0,255,255);
  ellipse(ballX,ballY,d,d);
  ballY+=speedY;
  ballX+=speedX;
 
 
if(ballY >= height || ballY <= 0) {
     
    speedY *= -0.95;
     
  }
   
  ballY = ballY + speedY;
  speedY = speedY + gravity;
   
  if(ballX >= width || ballX <= 0) {
       speedX *= -0.95;
  }
      
         
    if(ballY > height) {
     speedY = speedY * -0.95;
    }
    
   if(speedX < 1 && speedX > -1) {
     speedX = 0;
   }
 }

