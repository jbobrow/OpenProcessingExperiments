
boolean circlePressed, circlePressedR;
boolean circleClicked, circleClickedR;

float circleX, circleY, circleX2; //position of circle button

float circleSize = 60; //diameter of circle
float circleRadius;



color circleBlack, circleWhite, circleBlackR, circleWhiteR, circleBlackL2, circleWhiteL2, circleBlackR2, circleWhiteR2;
int value1W, value1B, value1Wr, value1Br, value3W, value3Wr, value3Br, value3B, value5W, value5Wr, value5B, value5Br;


float circleL5;
float circleR5;
float circleL3;
float circleR3;
//variables



void setup () {
  size (400, 400);
  smooth ();
  noStroke ();
  circleX = 100;
  circleX2 =300;
  circleY = 50;
  circleRadius = circleSize/2;
  circleBlack = color (0);
  circleWhite = color (255);
  circleBlackR = color (0);
  circleWhiteR = color (255);
  circleBlackL2 = color (0);
  circleWhiteL2 = color (255);
  circleBlackR2 = color (0);
  circleWhiteR2 = color (255);
  value1W = 255;
  value1B = 0;
  value1Wr = 255;
  value1Br = 0;
  value3W = 255;
  value3Wr = 255;
  value5W = 255;
  value5Wr = 255;
  // value3B = 0;
  //value3Br = 0;
  value5B = 0;
  value5Br = 0;
}

void draw() {
  //buttons
  background (127);
  circleL1();
  circleR1();
  fill ((circlePressed) ? 255 : 0);
  circleL2();
  fill ((circleClickedR) ? 0 : 255);
  circleR2();
  circleL3();
  circleR3();
  circleL4();
  circleR4();
  circleL5();
  circleR5();

  //middle button arrows
  arrowUp(93, 195, 255);
  arrowUp(293, 195, 0);
  arrowUp(107, 195, 255);
  arrowUp(307, 195, 0);

  // 5th button arrows
  arrowUp(100, 344, 255);
  arrowUp(300, 344, 0);

  //top button arrows
  arrowUp(100, 42, 255);
  arrowUp(300, 42, 0); 
  bottomDownArrow(91, 60, 255);
  bottomDownArrow(291, 60, 0);

  //2nd button arrows
  arrowDown (84, 135, 255);
  arrowDown (284, 135, 0);
  arrowDown (100, 135, 255);
  arrowDown (300, 135, 0);

  //4th button arrows

  arrowDown (91, 285, 255);
  arrowDown (291, 285, 0);
}


//mousePressed function that runs the 2nd circle actions
void mousePressed () {

  //circ2 actions
  if (dist (circleX, circleY+75, mouseX, mouseY) <= circleRadius) {
    circlePressed = !circlePressed;
  }
  if (dist (circleX2, circleY+75, mouseX, mouseY) <= circleRadius) {
    circleClickedR = !circleClickedR;
  }
}



//top buttons and actions that are based on mousePressed() function
void circleL1 () {
  fill (value1B);
  ellipse (circleX, circleY, circleSize, circleSize);
  if (mousePressed) {
    if (dist (circleX, circleY, mouseX, mouseY) <= circleRadius) {
      fill (value1W);
      ellipse (circleX, circleY, circleSize, circleSize);
    }
  }
}



void circleR1 () {
  fill (value1Wr);
  ellipse (circleX+200, circleY, circleSize, circleSize);
  if (mousePressed) {
    if (dist (circleX2, circleY, mouseX, mouseY) <= circleRadius) {
      fill (value1Br);
      ellipse (circleX2, circleY, circleSize, circleSize);
    }
  }
}


//2nd buttons
void circleL2 () {
  ellipse (circleX, circleY + 75, circleSize, circleSize);
} 




void circleR2 () {
  ellipse (circleX2, circleY + 75, circleSize, circleSize);
} 


//3rd buttons

void circleL3 () {
  fill (value3B);
  ellipse( circleX, circleY + 150, circleSize, circleSize);
} 




void circleR3 () {
  fill (value3Wr);
  ellipse( circleX2, circleY + 150, circleSize, circleSize);
} 



//4th buttons

void circleL4 () {
  fill (circleBlack);
  ellipse( circleX, circleY + 225, circleSize, circleSize);
  if (mousePressed) {
    if (dist (circleX, circleY+225, mouseX, mouseY) <= circleRadius) {
      circleBlack = circleWhite;
    }
  }
}



void circleR4 () {
  fill (circleWhiteR);
  ellipse( circleX2, circleY + 225, circleSize, circleSize);
  if (mousePressed) {
    if (dist (circleX2, circleY+225, mouseX, mouseY) <= circleRadius) {
      circleWhiteR = circleBlackR;
    }
  }
}


// bottom buttons
void circleL5 () {
  fill (value5B);
  ellipse( circleX, circleY + 300, circleSize, circleSize);
  if (dist (circleX, circleY + 300, mouseX, mouseY) <= circleRadius) {
  }
}



void circleR5 () {
  fill (value5Wr);
  ellipse( circleX2, circleY + 300, circleSize, circleSize);
  if (dist (circleX2, circleY + 300, mouseX, mouseY) <= circleRadius) {
  }
}




//mouse released over buttons to activate
void mouseReleased () { 
  //cirlce parameters of clicking

  circleL3 = dist(circleX, circleY + 150, mouseX, mouseY);
  circleR3 = dist(circleX2, circleY + 150, mouseX, mouseY);
  circleL5 = dist(circleX, circleY + 300, mouseX, mouseY);
  circleR5 = dist(circleX2, circleY + 300, mouseX, mouseY);




  //circ3 action 
  if ((value3B == 0) && (circleL3 <= circleRadius)) {
    value3B = 255;
  }
  else if ((value3B == 255) && (circleL3 <= circleRadius)) {
    value3B = 0;
  }


  //circ3r action
  if ((value3Wr == 255) && (circleR3 <= circleRadius)) {
    value3Wr = 0;
  }
  else if ((value3Wr == 0) && (circleR3 <= circleRadius)) {
    value3Wr = 255;
  }

  //cirlce5action
  if ((value5Wr == 255) && (circleR5 <= circleRadius)) {
    value5Wr = 0;
  } 
  //circle5left actions
  if ((value5B == 0) && (circleL5 <= circleRadius)) {
    value5B = 255;
  }
}



//arrow drawings

void arrowUp (int x, int y, int f) {
  fill (f);
  triangle (x, y-10, x-10, y, x+10, y);
  rect (x-2, y, 5, 25);
}



void arrowDown (int x, int y, int f) {
  fill (f);
  triangle (x+10, y+10, x, y, x+20, y);
  rect (x+7, y-25, 5, 25);
}





void bottomDownArrow (int x, int y, int f) {
  fill (f);
  triangle (x+10, y+10, x, y, x+20, y);
}


