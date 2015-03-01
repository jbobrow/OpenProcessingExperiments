
int winWidth = 640, // Change the window dimensions here.
winHeight = 480; 
// int customDetail = 20;
// This effects how smooth the curve can be.
// It requires P3D to be entered as the third parameter
// of window size in void setup.

float customLineWeight = 1, // This effects the curve thickness.
firstAnchorPointX, 
firstAnchorPointY, 
firstControlPointX, 
firstControlPointY, 
secondControlPointX, 
secondControlPointY, 
secondAnchorPointX, 
secondAnchorPointY, 

wasdX = 75, // These five floats govern 
wasdY = 75, // the First Anchor Point's speed,
wasdWidth = 10, // position and shape.
wasdHeight = 10, 
wasdMoveSpeed = 2.0, 

arrowsX = 565, // These five floats govern
arrowsY = 405, // the Second Anchor Point's speed,
arrowsWidth = 10, // position and shape.
arrowsHeight = 10, 
arrowsMoveSpeed = 2.0, 

tfghX = 125, // These five floats govern 
tfghY = 125, // the First Control Point's speed,
tfghWidth = 5, // position and shape.
tfghHeight = 5, 
tfghMoveSpeed = 2.0, 

ijklX = 515, // These five floats govern 
ijklY = 355, // the Second Control Point's speed,
ijklWidth = 5, // position and shape.
ijklHeight = 5, 
ijklMoveSpeed = 2.0;

boolean holdA = false, // Floats for AP1 input. 
holdD = false, 
holdW = false, 
holdS = false, 

holdLeft = false, // Floats for AP2 input.
holdRight = false, 
holdUp = false, 
holdDown = false, 

holdF = false, // Floats for CP1 input.
holdH = false, 
holdT = false, 
holdG = false, 

holdJ = false, // Floats for CP2 input.
holdL = false, 
holdI = false, 
holdK = false, 

holdShift = false, // Floats for gridline display.
holdSpace = false;

void setup() {
  size(winWidth, winHeight);
}

void draw() {
  background(#032C6E);
  noFill();
  strokeWeight(1);
  stroke(#032CFF);

  arrowsMove();
  wasdMove();
  tfghMove();
  ijklMove();
  showGuides();

  firstAnchorPointX = wasdX;
  firstAnchorPointY = wasdY; 
  firstControlPointX = tfghX;
  firstControlPointY = tfghY;
  secondControlPointX = ijklX; 
  secondControlPointY = ijklY; 
  secondAnchorPointX = arrowsX; 
  secondAnchorPointY = arrowsY;

  // Draws the two anchor points.
  stroke(#FFFF00);
  ellipse(wasdX, wasdY, wasdWidth, wasdHeight);
  ellipse(arrowsX, arrowsY, arrowsWidth, arrowsHeight);

  // Draws the two control points.
  stroke(#FF0000);
  rect(tfghX, tfghY, tfghWidth, tfghHeight);
  rect(ijklX, ijklY, ijklWidth, ijklHeight);

  // Displays the 8 parameters needed to code a Bezier Curve.
  text("AP1: (" + int(firstAnchorPointX) + ", " + int(firstAnchorPointY) + ")", firstAnchorPointX+6, firstAnchorPointY-6);
  text("CP1: (" + int(firstControlPointX) + ", " + int(firstControlPointY) + ")", firstControlPointX+6, firstControlPointY-6);
  text("CP2: (" + int(secondControlPointX) + ", " + int(secondControlPointY) + ")", secondControlPointX+6, secondControlPointY-6);
  text("AP2: (" + int(secondAnchorPointX) + ", " + int(secondAnchorPointY) + ")", secondAnchorPointX+6, secondAnchorPointY-6);

  // Draws lines from anchor to control point.
  stroke(#00FF00);
  line(firstControlPointX, firstControlPointY, firstAnchorPointX, firstAnchorPointY);
  line(secondControlPointX, secondControlPointY, secondAnchorPointX, secondAnchorPointY);

  // Converts mouse position values into values used for stroke
  // weight and curve smoothness.
  customLineWeight = int(map(mouseX, 0, width, 1, 31));
  // customDetail = int(map(mouseY, 0, height, 1, 31));

  // Displays the bezier curve itself.
  stroke(#FFFFFF);
  strokeWeight(abs(customLineWeight));
  // bezierDetail(abs(customDetail));
  bezier(firstAnchorPointX, firstAnchorPointY, firstControlPointX, firstControlPointY, secondControlPointX, secondControlPointY, secondAnchorPointX, secondAnchorPointY);

  // Dislays instructions at the bottom of the screen.
  noStroke();
  fill(#000000, 50);
  rect(0, height-65, width, 85);
  fill(#FFFFFF);
  text("Anchor Point 1: WASD. Anchor Point 2: Arrow keys. Control Point 1: TFGH. Control Point 2: IJKL.", 5, height-45);
  text("Mouse \u2194 to change stroke weight (" + int(customLineWeight) + ").", 5, height-25);

// Alternately, this text would display the curve's
// smoothness, if that functionality were commented back in.
// text("Mouse \u2194 to change stroke weight (" + int(customLineWeight) + "). Mouse \u2195 to change Bezier smoothness (" + int(customDetail) + ").", 5, height-25);

  noFill();
}

// This custom function holds all the variables which will be set
// to true once a key is pressed. It works with the baked-in
// key pressed and key released functions below. This way, 
// any other custom function can say "if the boolean var. name
// tied to the key is true, then do the following."

void setSignal(boolean setTo) {

  if (keyCode == LEFT) {
    holdLeft = setTo;
  }
  if (keyCode == RIGHT) {
    holdRight = setTo;
  }
  if (keyCode == UP) {
    holdUp = setTo;
  }
  if (keyCode == DOWN) {
    holdDown = setTo;
  }

  if (keyCode == SHIFT) {
    holdShift = setTo;
  }
  if (key == ' ') {
    holdSpace = setTo;
  }

  if (key == 'w' || key == 'W') {
    holdW = setTo;
  }
  if (key == 'a' || key == 'A') {
    holdA = setTo;
  }
  if (key == 's' || key == 'S') {
    holdS = setTo;
  }
  if (key == 'd' || key == 'D') {
    holdD = setTo;
  }

  if (key == 't' || key == 'T') {
    holdT = setTo;
  }
  if (key == 'f' || key == 'F') {
    holdF = setTo;
  }
  if (key == 'g' || key == 'G') {
    holdG = setTo;
  }
  if (key == 'h' || key == 'H') {
    holdH = setTo;
  }

  if (key == 'i' || key == 'I') {
    holdI = setTo;
  }
  if (key == 'j' || key == 'J') {
    holdJ = setTo;
  }
  if (key == 'k' || key == 'K') {
    holdK = setTo;
  }
  if (key == 'l' || key == 'L') {
    holdL = setTo;
  }
}

void keyPressed() {
  setSignal(true);
}

void keyReleased() {
  setSignal(false);
  //  modeSwitch(true);
}

// Controls Anchor Point 1
void wasdMove() {

  if (holdA && wasdX > 0) {
    wasdX -= wasdMoveSpeed;
  }
  if (holdD && wasdX < width) {
    wasdX += wasdMoveSpeed;
  }
  if (holdW && wasdY > 0) {
    wasdY -= wasdMoveSpeed;
  }
  if (holdS && wasdY < height) {
    wasdY += wasdMoveSpeed;
  }
}

// Controls Anchor Point 2
void arrowsMove() {

  if (holdLeft && arrowsX > 0) {
    arrowsX -= arrowsMoveSpeed;
  }
  if (holdRight && arrowsX < width) {
    arrowsX += arrowsMoveSpeed;
  }
  if (holdUp && arrowsY > 0) {
    arrowsY -= arrowsMoveSpeed;
  }
  if (holdDown && arrowsY < height) {
    arrowsY += arrowsMoveSpeed;
  }
}

// Controls Control Point 1
void tfghMove() {

  if (holdF && tfghX > 0) {
    tfghX -= tfghMoveSpeed;
  }
  if (holdH && tfghX < width) {
    tfghX += tfghMoveSpeed;
  }
  if (holdT && tfghY > 0) {
    tfghY -= tfghMoveSpeed;
  }
  if (holdG && tfghY < height) {
    tfghY += tfghMoveSpeed;
  }
}

// Controls Control Point 2
void ijklMove() {

  if (holdJ && ijklX > 0) {
    ijklX -= ijklMoveSpeed;
  }
  if (holdL && ijklX < width) {
    ijklX += ijklMoveSpeed;
  }
  if (holdI && ijklY > 0) {
    ijklY -= ijklMoveSpeed;
  }
  if (holdK && ijklY < height) {
    ijklY += ijklMoveSpeed;
  }
}

void showGuides() {

  //This if statement draws centerlines when spacebar is pressed.
  if (holdSpace) {

    line(0, (height/2), width, (height/2));
    line((width/2), 0, (width/2), height);
  }

  //This if statement draws Rule of Thirds guides when shift is pressed.
  if (holdShift) {

    line(0, (height/3), width, (height/3));
    line(0, (2*height/3), width, (2*height/3));
    line((width/3), 0, (width/3), height);
    line((2*width/3), 0, (2*width/3), height);
  }
  text("Hold space to show centerlines. Hold shift to show Rule of Thirds.", 5, height-5);
}
