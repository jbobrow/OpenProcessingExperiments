
/* Elizabeth Umbrino  
 August 10, 2011
 Eyes Homework
 */

// boolean eyesOpen = true;

//mouse
float xPos;
float yPos;

//eyes
float xPosLeft;
float yPosLeft;
float xPosRight;
float yPosRight;

void setup() {
  size(400, 400);
   background(0);
  smooth();
}

void draw() {
  noCursor();
  smooth();

  // xPos = constrain(mouseX, width/4, 3*width/4);
  // yPos = constrain(mouseY, height/4, 3*height/4);

  // eyes
  fill(#ffffff);
  ellipse(150, 200, 40, 40);
  ellipse(250, 200, 40, 40);

  //pupils

  fill(0);
  ellipse(xPosLeft, yPosLeft, 10, 10);
  ellipse(xPosRight, yPosRight, 10, 10);

  xPosLeft = constrain(mouseX, 150, 200);
  yPosLeft = constrain(mouseY, 150, 200);
  xPosRight = constrain(mouseX, 250, 200);
  yPosRight = constrain(mouseY, 150, 200);



  //mouse
  // ellipse(xPos, yPos, 20, 20);
}


