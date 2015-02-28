
float ballX = random(0, width);
float ballY = random(0, height);

float speedY = 10; //speedY also add speedX
float speedX = 5; //speedY also add speedX

float gravity = 0.8 ;

void setup() {
  size (400, 400);
  smooth();
  noStroke();
}

void draw() {

  background (0);

  ellipse (ballX, ballY, 30, 30);
  
  //This is where it makes gravity plus the ellpse move
  //This bit of code came from this guy //https://forum.processing.org/topic/how-to-make-a-ball-bounce-with-gravity
  //I did the rest. Thanks dude!
  
  ballY = ballY + speedY;
  speedY = speedY + gravity;
  
  ballX = ballX + speedX;
 // speedX = speedX + gravity;
  
  if (ballY >= height || ballY <= 0){
   speedY *= -0.8;
  }
  
   if (ballX >= width || ballX <= 0){
   speedX= -speedX;
  }


//Thanks Jason! http://www.openprocessing.org/sketch/66230
//friction
 if (ballY >= 390) {
    ballY = 390;
    speedY *= 0.944;
    speedX *= 0.95;
  }
  // Make SpeedX 0 if it's moving too slow horizontally
  if (abs(speedX) < 0.08) {
    speedX = 0;
  }
   
  // Make SpeedY 0 if it's moving too slow horizontally
  if (ballY == 390 && speedY > 9.5 && speedY < 10) {
    speedY = 0;
  }
   
  // If both speeds are 0, stop the animation
  if (speedY == 0 && speedX == 0) {
    noLoop();
  }


println(speedX);
}



