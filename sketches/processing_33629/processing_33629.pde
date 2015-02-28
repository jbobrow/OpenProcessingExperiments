
float leftEyeX;
float leftEyeY;
float leftPupilX;
float leftPupilY;

float rightEyeX;
float rightEyeY;
float rightPupilX;
float rightPupilY;


float eyeRadius;
float pupilRadius;

float leftAngle;
float rightAngle;

float leftDist;
float rightDist;

boolean eyesClosed;

void setup() {
  size(600, 400);
  background(150);
  smooth();

  leftEyeX = width/3;
  leftEyeY = height/3;

  rightEyeX = 2*width/3;
  rightEyeY = height/3;

  eyeRadius = 80;
  pupilRadius = 20;
  
  eyesClosed = false;
}

void draw() {
  background(255, 80, 0);

  fill(255);
  ellipse(leftEyeX, leftEyeY, 2*eyeRadius, 2*eyeRadius);
  ellipse(rightEyeX, rightEyeY, 2*eyeRadius, 2*eyeRadius);

  fill(0);

  //*******LEFT EYE******

  leftDist = dist(mouseX, mouseY, leftEyeX, leftEyeY);

  leftAngle = acos((mouseX-leftEyeX)/leftDist);
  //account for negative Y values
  if (mouseY <= leftEyeY) {
    leftAngle = PI*2 - leftAngle;
  }


  //**set pupil coordinates for left eye**
  //if pointer is inside the boundaries of the left eye:

  if (leftDist < (eyeRadius-pupilRadius)) {
    leftPupilX = mouseX;
    leftPupilY = mouseY;
  }
  //if outside the eye area:
  else {
    leftPupilX = cos(leftAngle)*(eyeRadius - pupilRadius) + leftEyeX;
    leftPupilY = sin(leftAngle)*(eyeRadius - pupilRadius) + leftEyeY;
  }
  //draw pupils
  ellipse(leftPupilX, leftPupilY, 2*pupilRadius, 2*pupilRadius);


  //*******RIGHT EYE******

  rightDist = dist(mouseX, mouseY, rightEyeX, rightEyeY);


  rightAngle = acos((mouseX-rightEyeX)/rightDist);
  //account for negative Y values
  if (mouseY <= rightEyeY) {
    rightAngle = PI*2 - rightAngle;
  }

  //**set pupil coordinates for right eye**
  //if pointer is inside the boundaries of the right eye:
  if (rightDist < (eyeRadius-pupilRadius)) {
    rightPupilX = mouseX;
    rightPupilY = mouseY;
  }
  //if outside the eye area:
  else {
    rightPupilX = cos(rightAngle)*(eyeRadius - pupilRadius) + rightEyeX;
    rightPupilY = sin(rightAngle)*(eyeRadius - pupilRadius)  + rightEyeY;
  }

  //draw pupils
  ellipse(rightPupilX, rightPupilY, 2*pupilRadius, 2*pupilRadius);

  if(eyesClosed){
    fill(155);
    ellipse(leftEyeX, leftEyeY, 2*eyeRadius, 2*eyeRadius);
    ellipse(rightEyeX, rightEyeY, 2*eyeRadius, 2*eyeRadius);
  }

}

void mouseReleased() {
   eyesClosed = !eyesClosed; 
}

