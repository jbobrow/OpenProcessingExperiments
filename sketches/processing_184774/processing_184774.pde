
int winWidth = 640, // Change the window dimensions here.
winHeight = 480;

float arrowsX = 175, // These five floats govern
arrowsY = 125, // the starting position, speed and shape of
arrowsWidth = 15, // the arrow-controlled ellipse.
arrowsHeight = 15, 
arrowsMoveSpeed = 2.0, 

wasdX = 300, // These five floats govern 
wasdY = 250, // the starting position, speed and shape of
wasdWidth = 15, // the WASD-controlled ellipse.
wasdHeight = 15, 
wasdMoveSpeed = 2.0, 

mouseWidth = 15, // These two floats govern shape for
mouseHeight = 15, // the mouse-controlled ellipse

xDistA = 0, // These following floats are used in the
yDistA = 0, // custom function vectorDiagnostic.
magnitudeA = 0, 
arrowsAngleA = 0, 
mouseAngleA = 0, 

xDistB = 0, 
yDistB = 0, 
magnitudeB = 0, 
wasdAngleA = 0, 
mouseAngleB = 0, 

xDistC = 0, 
yDistC = 0, 
magnitudeC = 0, 
arrowsAngleB = 0, 
wasdAngleB = 0, 

centerPointX = 0, 
centerPointY = 0, 
trianglePerimeter = 0, 
triangleArea = 0, 
inCircleRadius = 0, 
circumCircleRadius = 0, 

angleABD = 0, 
angleBDA = 0, 
angleDAB = 0;

boolean holdLeft = false, // These booleans are used in
holdRight = false, // the custom function setSignal,
holdUp = false, // which in turn passes them to
holdDown = false, // the custom function playerMove.
holdA = false, 
holdD = false, 
holdW = false, 
holdS = false, 
holdShift = false, 
holdSpace = false;

void setup() {
  noCursor();
  size(winWidth, winHeight);
}

void draw() {
  background(#032C6E);
  noFill();
  strokeWeight(1);

  stroke(#0766FF);
  showGuides();

  stroke(#FFFFFF);

  //These three ellipses highlight the three verteces of the triangle.
  ellipse(arrowsX, arrowsY, arrowsWidth, arrowsHeight);
  ellipse(wasdX, wasdY, wasdWidth, wasdHeight);
  ellipse(mouseX, mouseY, mouseWidth, mouseHeight);

  arrowsMove();
  wasdMove();

  vectorDiagnostic();
}

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

void vectorDiagnostic() {

  // Calculates the lengths of Arrows relation to Mouse.
  xDistA = dist(arrowsX, arrowsY, mouseX, arrowsY);
  yDistA = dist(mouseX, mouseY, mouseX, arrowsY);
  magnitudeA = dist(arrowsX, arrowsY, mouseX, mouseY);
  arrowsAngleA = atan(yDistA/xDistA); // In radians.
  mouseAngleA = atan(xDistA/yDistA); // In radians.

  // Calculates the lengths of WASD relation to Mouse.
  xDistB = dist(wasdX, wasdY, mouseX, wasdY);
  yDistB = dist(mouseX, mouseY, mouseX, wasdY);
  magnitudeB = dist(wasdX, wasdY, mouseX, mouseY);
  wasdAngleA = atan(yDistB/xDistB); // In radians.
  mouseAngleB = atan(xDistB/yDistB); // In radians.

  // Calculates the lengths of WASD relation to Arrows.
  xDistC = dist(wasdX, wasdY, arrowsX, wasdY);
  yDistC = dist(arrowsX, arrowsY, arrowsX, wasdY);
  magnitudeC = dist(wasdX, wasdY, arrowsX, arrowsY);
  arrowsAngleB = atan(xDistC/yDistC); // In radians.
  wasdAngleB = atan(yDistC/xDistC); // In radians.

  // Calculates the center point of the triangle.
  trianglePerimeter = magnitudeA+magnitudeB+magnitudeC;
  centerPointX = int((mouseX*magnitudeC+wasdX*magnitudeA+arrowsX*magnitudeB)/trianglePerimeter);
  centerPointY = int((mouseY*magnitudeC+wasdY*magnitudeA+arrowsY*magnitudeB)/trianglePerimeter);
  triangleArea = sqrt((trianglePerimeter/2) * ((trianglePerimeter/2)-magnitudeA) * ((trianglePerimeter/2)-magnitudeB) * ((trianglePerimeter/2)-magnitudeC));
  inCircleRadius = (2*triangleArea)/trianglePerimeter;
  circumCircleRadius = magnitudeA*magnitudeB*magnitudeC/sqrt((magnitudeB+magnitudeC+magnitudeA)*(magnitudeB+magnitudeC-magnitudeA)*(magnitudeC+magnitudeA-magnitudeB)*(magnitudeA+magnitudeB-magnitudeC));

  // Calculates the angles of triangle Arrows, Mouse, WASD.
  angleABD = acos((sq(magnitudeB) + sq(magnitudeA) - sq(magnitudeC))/(2*magnitudeB*magnitudeA));
  angleBDA = acos((sq(magnitudeB) + sq(magnitudeC) - sq(magnitudeA))/(2*magnitudeB*magnitudeC));
  angleDAB = acos((sq(magnitudeC) + sq(magnitudeA) - sq(magnitudeB))/(2*magnitudeC*magnitudeA));  

  // Draws the Arrows-Mouse Relation.
  stroke(#C8FF2A); // Yellow: magnitudeA from Arrows to the mouse.
  line(arrowsX, arrowsY, mouseX, mouseY);
  stroke(#F23317); // Red: Vertical distance from Arrows to the mouse.
  line(mouseX, mouseY, mouseX, arrowsY);
  stroke(#F23317); // Red: Horizontal distance from Arrows to the mouse.
  line(arrowsX, arrowsY, mouseX, arrowsY);

  // Draws the WASD-Mouse Relation.
  stroke(#FFFF00); // Yellow: magnitudeA from WASD to the mouse.
  line(wasdX, wasdY, mouseX, mouseY);
  stroke(#FF0000); // Red: Vertical distance from WASD to the mouse.
  line(mouseX, mouseY, mouseX, wasdY);
  stroke(#FF0000); // Red: Horizontal distance from WASD to the mouse.
  line(wasdX, wasdY, mouseX, wasdY);

  // Draws the WASD-Arrows Relation.
  stroke(#82A61B); // Green: magnitudeC from WASD to Arrows.
  line(wasdX, wasdY, arrowsX, arrowsY);
  stroke(#732115); // Brown: Vertical distance from WASD to Arrows;
  line(arrowsX, arrowsY, arrowsX, wasdY);
  stroke(#732115); // Brown: Vertical distance from WASD to Arrows;
  line(wasdX, wasdY, arrowsX, wasdY);

  // Draws the Center Point and Incircle.
  stroke(#FFFFFF);
  point(centerPointX, centerPointY);
  ellipse(centerPointX, centerPointY, inCircleRadius*2, inCircleRadius*2);
//  ellipse(, , circumCircleRadius*2, circumCircleRadius*2);

  // Line and point labels
  fill(#FFFFFF);
  text("A", arrowsX+6, arrowsY-8);
  text("B", mouseX+6, mouseY-8);
  text("C", mouseX+6, arrowsY-4);
  text("D", wasdX+6, wasdY-8);
  text("E", mouseX+6, wasdY-4);
  text("F", arrowsX+6, wasdY-4);
  text("G", centerPointX+6, centerPointY-4);

  // Draws the Boxes that go behind the text.
  strokeWeight(0);
  fill(0, 0, 0, 75);
  rect(5, 5, 204, 62); // Line lengths panel
  rect(5, 85, 150, 144); // Verteces panel
  rect(5, 246, 78, 180); // Angles panel


  // Displays diagnostic calculations.
  fill(#FFFFFF, 255);
  text("AC: " + round(xDistA), 10, 20);
  text("BC: " + round(yDistA), 10, 40);
  text("DE: " + round(xDistB), 80, 20);
  text("BE: " + round(yDistB), 80, 40);
  text("DF: " + round(xDistC), 150, 20);
  text("AF: " + round(yDistC), 150, 40);

  text("C: (" + mouseX + ", " + int(arrowsY) + ")", 10, 140);
  text("E: (" + mouseX + ", " + int(wasdY) + ")", 10, 180);
  text("F: (" + int(arrowsX) + ", " + int(wasdY) + ")", 10, 200);

  text("\u2220CAB " + round(degrees(arrowsAngleA)) + "\u00B0", 10, 260);
  text("\u2220ABC " + round(degrees(mouseAngleA)) + "\u00B0", 10, 280);
  text("\u2220EDB " + round(degrees(wasdAngleA)) + "\u00B0", 10, 300);
  text("\u2220DBE " + round(degrees(mouseAngleB)) + "\u00B0", 10, 320);
  text("\u2220FAD " + round(degrees(arrowsAngleB)) + "\u00B0", 10, 340);
  text("\u2220ADF " + round(degrees(wasdAngleB)) + "\u00B0", 10, 360);

  // Highlights in yellow those diagnostic calculations
  // believed to be most useful.
  fill(#FFFF00);
  text("A: (" + int(arrowsX) + ", " + int(arrowsY) + ") ARROWS", 10, 100);
  text("B: (" + mouseX + ", " + mouseY + ") MOUSE", 10, 120);
  text("D: (" + int(wasdX) + ", " + int(wasdY) + ") WASD", 10, 160);
  text("G: (" + int(centerPointX) + ", " + int(centerPointY) + ")", 10, 220);

  text("AB: " + round(magnitudeA), 10, 60);
  text("DB: " + round(magnitudeB), 80, 60);
  text("AD: " + round(magnitudeC), 150, 60);

  text("\u2220ABD " + round(degrees(angleABD)) + "\u00B0", 10, 380);
  text("\u2220BDA " + round(degrees(angleBDA)) + "\u00B0", 10, 400);
  text("\u2220DAB " + round(degrees(angleDAB)) + "\u00B0", 10, 420);
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
}

void keyPressed() {
  setSignal(true);
}

void keyReleased() {
  setSignal(false);
}

