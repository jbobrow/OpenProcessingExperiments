
final int kMaxBalls = 10; // max # of balls user can create
int gNumBalls = 0;        // count # of balls created so far

// arrays to hold ball x/y positions
int[] gBallX = new int[kMaxBalls];
int[] gBallY = new int[kMaxBalls];
final int kBallStep = 2;  // max amount by which the random walk generator can move

// array to hold ball sizes; min/max size of balls
final int kBallSize = 30;

final int kStepTime = 20;  // how fast to step
int gLastTime = 0;         // saves last time the draw() loop completed

void setup()
{
  // usual setup stuff
  size(400, 400);
  smooth();
}

void draw() {
  // check current time
  int thisTime = millis();

  // if enough time has elapsed...
  if (thisTime - gLastTime >= kStepTime) {
    // draw black background
    background(0, 0, 0);

    // run once for each ball on the screen
    for (int i = 0; i < gNumBalls; i++) {
      // draw a ball at its current location, color and size
      // we retrieve this info from the arrays
      fill(255, 0, 0);
      ellipse(gBallX[i], gBallY[i], kBallSize, kBallSize);

      // update the ball's parameters

      // basically a coin toss to determine step direction for x/y
      // we will then step by kBallStep in those directions
      if (random(2) >= 1.0) {
        gBallX[i] += kBallStep;
      }
      else {
        gBallX[i] -= kBallStep;
      }
      // constrain to window size
      gBallX[i] = constrain(gBallX[i], 0, width);

      // same for y
      if (random(2) >= 1.0) {
        gBallY[i] += kBallStep;
      }
      else {
        gBallY[i] -= kBallStep;
      }
      // constrain to window size
      gBallY[i] = constrain(gBallY[i], 0, width);

      // save time
      gLastTime = thisTime;
    }
  }
}

void mousePressed()
{
  // if we haven't hit our max # of balls, add a new one at mousex/y
  if (gNumBalls < kMaxBalls) {
    gBallX[gNumBalls] = mouseX;
    gBallY[gNumBalls] = mouseY;
    gNumBalls++;
  }
}


