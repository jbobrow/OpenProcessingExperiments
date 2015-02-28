
float ballX;
float ballY;
float speedX;
float speedY;
float gravity;

void setup(){
 size(400, 400);
 frameRate(60);
 
 ballX = (200);
 ballY = (200);
 
 speedY=10;
 speedX=5;
 gravity=0.428;  
}

void draw(){
  smooth();
  stroke(0);
  background(255);
  fill(200);
  ellipse(ballX, ballY, 10, 10);
  
   speedY = speedY+gravity;
   speedX = speedX *.999;

  
  ballY += speedY;
  ballX += speedX;
  

  if(ballY >= height-10 || ballY <= 10) {
    speedY *= -.95;
    speedY -= gravity;
}
  
  if(ballX >= width-10 || ballX <= 10) {

    speedX *=-.95;
  }
   if (ballY == 395 && speedY < .5) {
    speedY = 0;
  }
    if (speedX < 1 && speedX > -1) {
    speedX = 0;
  }


}

