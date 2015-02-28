
int numButtons = 10;
// keep track of which button is mouse in on
int currentButton;
float buttonRadius;

// keep track of button x and y based on if button is up or down
float[] buttonX = new float[numButtons];
float[] buttonY = new float[numButtons];
// set of x and y locations when button is up
float[] buttonUpX = new float[numButtons];
float[] buttonUpY = new float[numButtons];
//set of x and y locations when button is down
float[] buttonDownX = new float[numButtons];
float[] buttonDownY = new float[numButtons];

// keep track of which row and col each button is in
int[] buttonCol = new int[numButtons];
int[] buttonRow = new int[numButtons];

// keep track if each button is up or down
boolean[] buttonDown = new boolean[numButtons];
boolean[] buttonUp = new boolean[numButtons];

// keep track of the color of each button based on up or down
float[] buttonFill = new float[numButtons];
float[] arrowFill = new float[numButtons];

void setup() {
  size(900, 400);

  buttonRadius = 75;

  for (int col=0; col<5; col++) {
    for (int row=0; row<2; row++) {
      if (row == 0) {
        // initialize buttons in top row to be white
        buttonFill[col+(5*row)] = 255;
        arrowFill[col+(5*row)] = 0;
      }
      else if (row==1) {
        // initialize buttons in bottom row to be black
        buttonFill[col+(5*row)] = 0;
        arrowFill[col+(5*row)] = 255;
      }
      // set up and down locations for each button
      buttonUpX[col+(5*row)] = 90+col*180;
      buttonUpY[col+(5*row)] = 100+row*200;
      buttonDownX[col+(5*row)] = buttonUpX[col+(5*row)] - 10;
      buttonDownY[col+(5*row)] = buttonUpY[col+(5*row)] + 10;
      // set row and col of each button
      buttonCol[col+(5*row)] = col;
      buttonRow[col+(5*row)] = row;
    }
  }

  for (int i=0; i<numButtons; i++) {
    // initialize each button to be up
    buttonDown[i] = false;
    buttonUp[i] = true;
    buttonX[i] = buttonUpX[i];
    buttonY[i] = buttonUpY[i];
  }
}

void draw() {
  background(50);
  drawButtons();
  currentButton = checkButtons();
  animate();
}

int checkButtons() {
  for (int i=0; i<numButtons; i++) {
    /* if the mouse is on any of the buttons, return the index
    of that button */
    if (mouseOnButton(i)) {
      return i;
    }
  }
  return -1;
}

boolean mouseOnButton(int buttonIndex) {
  // get distance between mouseX and center of button
  float xDist = abs(mouseX-buttonX[buttonIndex]);
  // get distance between mouseY and center of button
  float yDist = abs(mouseY-buttonY[buttonIndex]);
  // get distance between mouse and center of button
  float totalDist = sqrt(xDist*xDist + yDist*yDist);
  /* if the distance between the mouse and the center of the
  button is less than the button radius, the mouse is on the 
  button */
  if (totalDist < buttonRadius) {
    return true;
  } 
  else {
    return false;
  }
}

void animate() {
  for (int i=0; i<numButtons; i++) {
    if (buttonDown[i]) {
      // if the button is down, set its down x and y locations
      buttonX[i] = buttonDownX[i];
      buttonY[i] = buttonDownY[i];
      // if the button is down, flip the colors of the button
      if (buttonRow[i]==0) {
        buttonFill[i] = 0;
        arrowFill[i] = 255;
      } 
      else if (buttonRow[i]==1) {
        buttonFill[i] = 255;
        arrowFill[i] = 0;
      }
    }
    else if (buttonUp[i]) {
      // if the button is up, set its up x and y locations
      buttonX[i] = buttonUpX[i];
      buttonY[i] = buttonUpY[i];
      // if the button is up, set colors back to initial
      if (buttonRow[i]==0) {
        buttonFill[i] = 255;
        arrowFill[i] = 0;
      } 
      else if (buttonRow[i]==1) {
        buttonFill[i] = 0;
        arrowFill[i] = 255;
      }
    }
  }
}

void mousePressed() {
  if (currentButton != -1) {
    // animate the buttons based on which col they are in
    switch(buttonCol[currentButton]) {
    case 0:
    // whenever mouse is pressed, button is down until release
      buttonDown[currentButton] = true;
      buttonUp[currentButton] = false;
      return;
    case 1:
    // whenever mouse is pressed, flip position of button
      buttonDown[currentButton] = !buttonDown[currentButton];
      buttonUp[currentButton] = !buttonUp[currentButton];
      return;
    case 2:
      return;
    case 3:
    // whenever mouse is pressed, button stays down indefinitely
      buttonDown[currentButton] = true;
      buttonUp[currentButton] = false;
      return;
    case 4:
      return;
    }
  }
}

void mouseReleased() {
  /* whenever mouse is released, be sure to release the buttons
  in the first col */
  buttonDown[0] = false;
  buttonUp[0] = true;
  buttonDown[5] = false;
  buttonUp[5] = true;
  if (currentButton != -1) {
    switch(buttonCol[currentButton]) {
    case 0:
    // whenever mouse is released, button is up until pressed
      buttonDown[currentButton] = false;
      buttonUp[currentButton] = true;
      return;
    case 1:
      return;
    case 2:
    // whenever mouse is released, flip position of button
      buttonDown[currentButton] = !buttonDown[currentButton];
      buttonUp[currentButton] = !buttonUp[currentButton];
      return;
    case 3:
      return;
    case 4:
    // whenever mouse is released, button is down indefinitely
      buttonDown[currentButton] = true;
      buttonUp[currentButton] = false;
      return;
    }
  }
}

void keyPressed() {
  // if 'r' is pressed, reset the buttons
  if (key=='r' || key=='R') {
    setup();
  }
}

void drawButtons() {
  int arrowOffset = 25;

  for (int i=0; i<numButtons; i++) {
    // draw button depth
    fill(100);
    stroke(150);
    ellipse(buttonDownX[i], buttonDownY[i], 2*buttonRadius, 
    2*buttonRadius);
    
    // draw each button
    fill(buttonFill[i]);
    stroke(arrowFill[i]);
    ellipse(buttonX[i], buttonY[i], 2*buttonRadius, 
    2*buttonRadius);
    // draw icon based on col
    switch(buttonCol[i]) {
    case 0:
    // one double-headed arrow
      drawDoubleArrow(arrowFill[i], buttonX[i]-arrowOffset, 
      buttonY[i]-arrowOffset);
      break;
    case 1:
    // two single-headed down arrows
      drawSingleArrow(arrowFill[i], buttonX[i]-25-arrowOffset, 
      buttonY[i]-arrowOffset, 1);
      drawSingleArrow(arrowFill[i], buttonX[i]+25-arrowOffset, 
      buttonY[i]-arrowOffset, 1);
      break;
    case 2:
    // two single-headed up arrows
      drawSingleArrow(arrowFill[i], buttonX[i]-25-arrowOffset, 
      buttonY[i]-arrowOffset, 0);
      drawSingleArrow(arrowFill[i], buttonX[i]+25-arrowOffset, 
      buttonY[i]-arrowOffset, 0);
      break;
    case 3:
    // one single-headed down arrow
      drawSingleArrow(arrowFill[i], buttonX[i]-arrowOffset, 
      buttonY[i]-arrowOffset, 1);
      break;
    case 4:
    // one single-headed up arrow
      drawSingleArrow(arrowFill[i], buttonX[i]-arrowOffset, 
      buttonY[i]-arrowOffset, 0);
      break;
    }
  }
}

void drawSingleArrow(float arrowFill, float x, float y, 
float dir) {
  fill(arrowFill);
  // arrow-head is up
  if (dir==0) {
    rect(x+15, y, 20, 75);
    drawArrowHead(arrowFill, x, y, 0);
  }
  else if (dir==1) {
    // arrow-head is down
    rect(x+15, y-25, 20, 75);
    drawArrowHead(arrowFill, x, y+50, 1);
  }
}

void drawDoubleArrow(float arrowFill, float x, float y) {
  fill(arrowFill);
  rect(x+15, y, 20, 50);
  // up arrow-head
  drawArrowHead(arrowFill, x, y, 0);
  // down arrow-head
  drawArrowHead(arrowFill, x, y+50, 1);
}

void drawArrowHead(float arrowFill, float x, float y, int dir) {
  fill(arrowFill);
  if (dir==0) {
    // point is up
    triangle(x, y, x+50, y, x+25, y-25);
  }
  else if (dir==1) {
    // point is down
    triangle(x, y, x+50, y, x+25, y+25);
  }
}


