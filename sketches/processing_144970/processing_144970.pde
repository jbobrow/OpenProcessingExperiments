
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JANG jin seon
// ID: 201420105

float speedX, speedY;
float objectX, objectY, objectWidth, objectHeight;


float GRAVITY = 0.9;

float DAMPING = 0.9;


float FRICTION = 0.9;

void setup() {
  size(600, 600);

  objectX = width/2;
  objectY = 10;

  objectWidth = 30;
  objectHeight = objectWidth;

  speedX = 4;
  speedY = 4;
}

void draw() {



  fill(100, 60);
  rect(0, 0, width, height);

  drawObject();
  adjustForGravity();
  updateObjectLocation();
  checkForCollision();
}


void drawObject() {
  fill(0);
  rect(objectX, objectY, objectWidth, objectHeight);
}


void updateObjectLocation() {
  objectX = objectX + speedX;
  objectY = objectY + speedY;
}


void adjustForGravity() {
  speedY = speedY + GRAVITY;
}


void checkForCollision() {


  if (objectX > width - objectWidth) {
    objectX = width - objectWidth;
    speedX = -10 * speedX;
  }

  else if (objectX < 0) {
    objectX = 10;
    speedX = -10 * speedX;
  }


  if (objectY > height - objectHeight) {
    objectY = height - objectHeight;
    speedY = -1 * speedY;
    speedY = DAMPING * speedY;
    speedX = FRICTION * speedX;
  }
}
