
float speedX = 3;
float speedY = 5;
float ballX = 300;
float ballY = 50;
 
float gravity = 0.5;

void setup() {
  size(400,400);
  smooth();
  noStroke();
}
 
void draw() {
  background(255);
  fill(240, 128, 128);
  ellipse(ballX, ballY, 20, 20);
  ballY += speedY;
  ballX += speedX;
  
  speedY += gravity;
   
  if (ballY >= height-5 || ballY <= 0 ) {
    speedY *= -0.95;
  }
  if (ballX >= width-5 || ballX <= 5 ) {
    speedX *= -1;
  }
}

