
/*This program shows a way to draw a basic cycloid.*/

void setup() {
  background(0);
  size(500, 500);
}

//These variables to determine the output screen size
int winWidth = 1200;
int winHeight = 300;

//These are the new origin Point of the screen Coordinates.
float originX = (0.05)* winWidth;
float originY = (0.75)* winHeight;

//radianAmount variable to hold the rotation amount in radians.
float radianAmount = 0;

float circleRadius = 50;

void draw() {
  doTransformations();
  drawCircle();

  undoTransformations();
  printInstructions();
  drawEarthLine();

  fadeEffect();
}

void drawCircle() {
  //Draw the ellipse at the origin of screen.
  noFill();
  stroke(150, 50);
  ellipse(0, 0, 2*circleRadius, 2*circleRadius);
  
  //This is to indicate the center of Ellipse
  fill(255, 0, 255, 50);
  ellipse(0,0,5,5);
  
  //These are to indicate the centeral top and bottom points of Ellipse
  fill(255, 255, 0);
  stroke(150);
  ellipse(0, 0+circleRadius, 5, 5);
  ellipse(0, 0-circleRadius, 5, 5);
 
  stroke(255,255,0, 90); 
  line(0,0+circleRadius, 0, 0-circleRadius);
}

void printInstructions() {
  text("Use Arrow Keys to move Circle", 50, 50);
}

void drawEarthLine() {
  stroke(150);
  line(0, originY+circleRadius, width, originY+circleRadius);
}

void fadeEffect() {
  fill(0,5);
  noStroke();
  rect(0, 0, winWidth, winHeight);
}

void doTransformations() {
  translate(originX, originY); 
  rotate(radianAmount);
}

void undoTransformations() {
  rotate(-radianAmount);
  translate(-originX, -originY);
}

void keyPressed() {

  //Road lenght amount taken at each step to the circumference of circle Ratio
  float ratio = 0.015;
  float circumference = 2 * PI * circleRadius;

  if (keyCode == RIGHT) {
    originX += ratio * circumference;
    radianAmount += ratio * (2 * PI) ;
  }

  if (keyCode == LEFT) {
    originX -= ratio * circumference;
    radianAmount -= ratio * (2 * PI) ;
  }
}



