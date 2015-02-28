
/////////////////////////////////////////////////////////////////////////////
// A Cannon Firing
// By Ryan Ley
/////////////////////////////////////////////////////////////////////////////

// Constant for the length of the barrel
final float BARREL_LENGTH = 100.;

// Constant used to determine width of barrel by changing angle
final float BARREL_WIDTH = .088;

// Global Variables for cannon
float cannonAngle = PI/4.0;
float ballAngle = cannonAngle;
float ballX = cannonBallX();
float ballY = cannonBallY();

// Motion of the ball
final float CANNON_POWER = 15;
float gravity = .35;
float speedX = CANNON_POWER * cos(ballAngle);
float speedY = -CANNON_POWER * sin(ballAngle);

// Trigger varible for 
boolean stuck = true;

float cannonBottomX() {
  float coordinate = BARREL_LENGTH * cos(cannonAngle - BARREL_WIDTH);
  return coordinate;
}

float cannonBottomY() {
  float coordinate = 500 - BARREL_LENGTH * 
    sin(cannonAngle - BARREL_WIDTH);
  return coordinate;
}

float cannonTopX() {
  float coordinate = BARREL_LENGTH * 
    cos(cannonAngle + BARREL_WIDTH);
  return coordinate;
}

float cannonTopY() {
  float coordinate = 500 - BARREL_LENGTH * 
    sin(cannonAngle + BARREL_WIDTH);
  return coordinate;
}

float cannonBallX() {
  float coordinate = ( BARREL_LENGTH * cos(ballAngle) ) - 5;
  return coordinate;
}

float cannonBallY() {
  float coordinate = ( 500 - BARREL_LENGTH * sin(ballAngle) ) + 5;
  return coordinate;
}

void setup() {
  size(500, 500);
}

void draw() {

  // Makes background
  background(20, 20, 255);
  fill(0, 255, 0);
  rect(0, .8*height, width, .2*height);

  drawCannon();
  drawTarget();
  moveCannonGun();
  shoot();
  adjustBallPosition();
}

// Draws the Cannon
void drawCannon() {

  // draw cannon ball
  fill(0);
  ellipse(ballX, ballY, 10, 10);

  // Draws a cannon
  fill(123, 60, 140);
  triangle(0, height, cannonBottomX(), cannonBottomY(), 
  cannonTopX(), cannonTopY());
  ellipse(0, height, 100, 100);
}

void moveCannonGun() {
  float cannonSpeed = .025;
  if (keyPressed) {
    // Moves Gun counterclockwise with up and left keys
    if ( keyCode == UP || keyCode == LEFT ) {
      cannonAngle = cannonAngle + cannonSpeed;
    }
    // Moves gun clockwise with down and right keys
    else if ( keyCode == DOWN || keyCode == RIGHT ) {
      cannonAngle = cannonAngle - cannonSpeed;
    }
  }
} 

// Draws a red and white target
void drawTarget() {

  float targetCenterX = .975 * width;
  float targetCenterY = height/2;
  
  // Draws the target
  fill(255, 0, 0);
  ellipse(targetCenterX, targetCenterY, .05*width, .05*width);
  fill(255);
  ellipse(targetCenterX, targetCenterY, .035*width, .035*width);
  fill(255, 0, 0);
  ellipse(targetCenterX, targetCenterY, .015*width, .015*width);
}

void adjustBallPosition() {

  // Keeps the ball aligned with the cannon before firing
  if ( key == 32 ) {
    stuck = false;
  }
  if ( ballX > width || ballY < 0 || ballY > height ) {
    stuck = true;
  }
}

// Causes the ball to fire
void shoot() {

  // Sets the cannon ball to the gun
  if ( stuck ) {
    ballX = cannonBallX();
    ballY = cannonBallY();
    ballAngle = cannonAngle;
    speedY = -CANNON_POWER * sin(ballAngle);
  }
  // Gives the ball parabolic motion with gravity
  else {
    ballX = ballX + speedX;
    ballY = ballY + speedY;
    speedY = speedY + gravity;
  }
}


