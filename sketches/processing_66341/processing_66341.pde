



float ballX;
float ballY;
float speedY;
float speedX;
float gravity;


void setup() {
  
noStroke();
size(400, 400);
smooth();
frameRate(60);

ballX = (width/2);
ballY = (0);

gravity = 0.3;

speedY = 7;
speedX = 2;


}

void draw() {
  
  background(255);
  fill(10, 200, 100);
  ellipse(ballX, ballY, 15, 15);
  ballY += speedY;
  ballX += speedX;
  
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



