
// BOUNCING BALL -------------------------------
float speedX;
float speedY;
float ballX;
float ballY;

float gravity;



void setup() {
  size(400,400);
  smooth();
  noStroke();
  frameRate(60);
  
  ballX = int(random(0,width));
  ballY = int(random(0,height));
  
  speedX = 5;
  speedY = 10;
  
  gravity = 0.6;
}

void draw() {
  background(255);
  fill(125);
  ellipse(ballX, ballY, 20, 20);
  ballY += speedY;
  ballX += speedX;
  
  if (ballY >= height || ballY <= 0 ) {
    // This is important, so that speedY slows down when it hits the edges
    // Not necessary for speedX for some reason
    speedY *= -0.95;
  }
  if (ballX >= width || ballX <= 0 ) {
    speedX *= -1;
  }
  
  
  // Add gravity to speedY here, instead of at the end
  speedY += gravity;
  
  
  // Limit bottom EDGE of the ball (not the center position of the ball) to the bottom of the screen
  if (ballY >= 390) {
    ballY = 390;
    speedY *= 0.944;
    speedX *= 0.95;
  }

  // Make SpeedX 0 if it's moving too slow horizontally
  if (speedX < 0.08 && speedX > -0.08) {
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
  
  // Debugging
  println("Position X: " + ballX + "; Position Y: " + ballY + "; Speed X: " + speedX + "; Speed Y: " + speedY);
  
}

