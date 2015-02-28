
/*

Simple movement behavior.

@author Rafael Rinaldi (rafaelrinaldi.com)
@since Apr 26, 2012

*/

// Ball position.
float pX = 0;
float pY = 0;

// Ball settings.
int BALL_SIZE = 10;
int SPEED = 8;

// Setting up a random radian.
float angle = randomRadian();

void setup() {
  frameRate(60);
  size(400, 500);
}

void draw() {
  background(0);
  ellipse(pX, pY, BALL_SIZE, BALL_SIZE);
  updatePosition();
  touchHandler();
}

// Handles ball positioning.
void updatePosition() {
  pX += SPEED * cos(angle);
  pY += SPEED * sin(angle);
}

// Handles ball when it touches canvas ends.
void touchHandler() {
  
  if(pX >= width) {
    angle -= randomRadian();
    pX = width;
  } else if(pX <= 0) {
    angle += randomRadian();
    pX = 0;
  } else if(pY >= height) {
    angle -= randomRadian();
    pY = height;
  } else if(pY <= 0) {
    angle += randomRadian();
    pY = 0;
  }
  
}

/*
@return Random radian value between 0 and 180.
*/
float randomRadian() {
  return radians(random(0, 180));
}

