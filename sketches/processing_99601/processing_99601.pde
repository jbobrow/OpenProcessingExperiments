
int numBalls = 6;
float ballX[] = new float[numBalls];
float ballY[] = new float[numBalls];
float speedX[] = new float[numBalls];
float speedY[] = new float[numBalls];
 
// made the gravity a little stronger
float gravity = .07;
 
void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < numBalls; i++) { 
    // initializing random start point for each ball, and set each ball to speed of 2
    ballX[i] = int(random(0, 100));
    ballY[i] = int(random(10, 100));
    speedX[i] = 2;
    speedY[i] = 1;
  }
}
 
void draw() {
  background(255);
  fill(0);
 
  // use a for loop to go through the array
 
  for (int i = 0; i<numBalls; i++) {
    // here is where we draw the ball
    fill(255);
    ellipse(ballX[i], ballY[i], 40, 40);
 
    // here is where we increase the balls position
    ballX[i] = ballX[i] + speedX[i];
    ballY[i] = ballY[i] + speedY[i];
    
    // gravity
    speedY[i] = speedY[i] + gravity;
 
    // reverse direction and dampen the speed
    if (ballY[i] > height-19) {
      speedY[i] = speedY[i] * -0.95;
    }
    
    // test for width
    if (ballX[i] > width-21 || ballX[i] < 21) {
      speedX[i] = speedX[i] * (-1);
    }
  }
}


