
// BOUNCING BALLS -------------------------------
int numBalls = 5;


float[] speedX = new float[numBalls];
float[] speedY = new float[numBalls];
float[] ballX = new float[numBalls];
float[] ballY = new float[numBalls];

float gravity;



void setup() {
  size(400, 400);
  smooth();
  noStroke();
  frameRate(60);

  for (int i = 0; i < numBalls; i++) {
    speedX[i] = random(0, 5);
    speedY[i] = random(0, 10);
    ballX[i] = random(width);
    ballY[i] = random(height);
  }
  //  
  //  ballX = int(random(0,width));
  //  ballY = int(random(0,height));
  //  
  //  speedX = 5;
  //  speedY = 10;

  gravity = 0.6;
}

void draw() {
  background(255);
  fill(125);

  for (int i = 0; i < numBalls; i++) {
    ellipse(ballX[i], ballY[i], 20, 20);
    ballX[i] += speedX[i];
    ballY[i] += speedY[i];

    if (ballY[i] >= height || ballY[i] <= 0 ) {
      // This is important, so that speedY slows down when it hits the edges
      // Not necessary for speedX for some reason
      speedY[i] *= -0.95;
    }
    if (ballX[i] >= width || ballX[i] <= 0 ) {
      speedX[i] *= -1;
    }

    // Add gravity to speedY here, instead of at the end
    speedY[i] += gravity;


    // Limit bottom EDGE of the ball (not the center position of the ball) to the bottom of the screen
    if (ballY[i] >= 390) {
      ballY[i] = 390;
      speedY[i] *= 0.944;
      speedX[i] *= 0.95;
    }

    // Make SpeedX 0 if it's moving too slow horizontally
    if (speedX[i] < 0.08 && speedX[i] > -0.08) {
      speedX[i] = 0;
    }

    // Make SpeedY 0 if it's moving too slow horizontally
    if (ballY[i] == 390 && speedY[i] > 9.5 && speedY[i] < 10) {
      speedY[i] = 0;
    }

    // If both speeds are 0, stop the animation
//    if (speedY[i] == 0 && speedX[i] == 0) {
//      noLoop();
//    }
  }




  // Debugging
//  println("Position X: " + ballX + "; Position Y: " + ballY + "; Speed X: " + speedX + "; Speed Y: " + speedY);
}


