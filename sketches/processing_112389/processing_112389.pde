
//I'm using floats here so you can have more control over speed
float ballX;
float ballY;
float ballXSpeed = 2.5;
float ballYSpeed = 3;

void setup() {  //setup function called initially, only once
  size(640, 480);
}

void draw() {  //draw function loops 
  background(255);
  ballX = ballX + ballXSpeed;
  ballY = ballY + ballYSpeed;
  
  fill(100, 40, 200);
  ellipse(ballX, ballY, 20, 20);
  
  //wrap screen on X axis
  if (ballX > width) {
      ballX = 0;
      }
  if (ballX < 0) {
      ballX = width;
  }
  
  //wrap screen on Y axis
  if (ballY > height) {
      ballY = 0;
      }
  if (ballY < 0) {
      ballY = height;
  }
  
}
