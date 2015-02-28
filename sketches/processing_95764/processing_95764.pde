
/*
Mapped Eyes
 Jennifer Presto
 Example for BFA class in Creative Computing
 April 9, 2013
 */

// variables for the whites of the eyes
// these stay the same throughout the sketch
float leftEyeX = 125;
float leftEyeY = 300;
float rightEyeX = 275;
float rightEyeY = 300;

// variables for the pupils
// note that these aren't given values here,
// since they will change while the sketch is running
float leftPupilX;
float leftPupilY;
float rightPupilX;
float rightPupilY;

void setup() {
  size (400, 600);
  stroke(0);
  smooth();
}

void draw() {

  // draw the head and mouth
  strokeWeight(4);
  fill(255, 255, 0);
  ellipse(width/2, height/2, 350, 350);
  line(150, 400, 250, 400);

  // draw the whites of the eyes
  strokeWeight(1);
  fill(255, 255, 255);
  ellipse(leftEyeX, leftEyeY, 100, 100);
  ellipse(rightEyeX, rightEyeY, 100, 100);

  // update the x and y positions of the pupils
  leftPupilX = map(mouseX, 0, width, leftEyeX-25, leftEyeX+25);
  leftPupilY = map(mouseY, 0, height, leftEyeY-25, leftEyeY+25);
  rightPupilX = map(mouseX, 0, width, rightEyeX-25, rightEyeX+25);
  rightPupilY = map(mouseY, 0, height, rightEyeY-25, rightEyeY+25);

  // draw the pupils

  fill(0);
  ellipse(leftPupilX, leftPupilY, 50, 50);
  ellipse(rightPupilX, rightPupilY, 50, 50);
}



