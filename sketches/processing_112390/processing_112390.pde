
//I'm using floats here so you can have more control over speed
float ballX;
float ballY;
float ballXSpeed = 2;
float ballYSpeed = -3.5;
 
void setup() {
  size(640, 480);
}
 
void draw() {
  background(255);
  ballX = ballX + ballXSpeed;
  ballY = ballY + ballYSpeed;
   
  fill(40, 100, 200);
  ellipse(ballX, ballY, 20, 20);
   
  //Bounce off the left and right of the screen
  if (ballX > width) {
      ballXSpeed = ballXSpeed * -1;
      }
  if (ballX < 0) {
      ballXSpeed = ballXSpeed * -1;
  }
   
  //Bounce off top and bottom of the screen
  if (ballY > height) {
      ballYSpeed = ballYSpeed * -1;
      }
  if (ballY < 0) {
      ballYSpeed = ballYSpeed * -1;
  }
   
}
