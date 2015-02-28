
/*

 Title: Flower Maker
 Author: Ray Elder
 Version: 2.0
 Date: 17 May 2010
 Modified: 14 January 2014
 Description: Function to draw multiple flowers without using translate().

*/

Boolean verbose = true;       // set verbose to false to remove points and control points
int radius = 20;              // sets the center radius of the flower
int totalPetals = 8;
float petalLength = 200;
int controlPointDiameter = 5;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  drawFlower(width/2, height/2);
}

void drawFlower(int centerX, int centerY) {

  float pX = 0.0;
  float pY = 0.0;
  int diameter = radius * 2;

  if (verbose) {
    // if true draw center point
    noStroke();
    fill(255, 0, 0);
    ellipse(centerX, centerY, controlPointDiameter, controlPointDiameter);
  }

  // draw center ellipse of the flower
  noFill();
  stroke(0);
  ellipse(centerX, centerY, diameter, diameter);

  // reset starting angle to 0 degrees
  float angle = 0.0;

  // draw petals around the center ellipse of the flower
  for (int c = 0; c < totalPetals; c++)  {

    // calculate starting point
    pX = centerX + cos(radians(angle)) * radius;
    pY = centerY + sin(radians(angle)) * radius;

    // call drawPetal function to calculate control points and set bezierVertices
    drawPetal(pX, pY, angle);

    // increment angle based on total number of petals
    angle -= (360 / totalPetals);
  }
}

void drawPetal(float startX, float startY, float angle) {

  // set offset for control points
  float bezierDiff = petalLength / 2;

  // set angle for start's control points
  float startAngleTop = angle - 45;
  float startAngleBottom = angle + 45;

  // set angle for end's control points
  float endAngleTop = angle - 135;
  float endAngleBottom = angle + 135;

  // calculate start's top control point
  float startAngleTopX = startX + cos(radians(startAngleTop))*bezierDiff;
  float startAngleTopY = startY + sin(radians(startAngleTop))*bezierDiff;

  // calculate start's bottom control point 
  float startAngleBottomX = startX + cos(radians(startAngleBottom))*bezierDiff;
  float startAngleBottomY = startY + sin(radians(startAngleBottom))*bezierDiff;

  // calculate end point
  float endX = startX + cos(radians(angle))*petalLength;
  float endY = startY + sin(radians(angle))*petalLength; 

  // calculate end's top control point 
  float endAngleTopX = endX + cos(radians(endAngleTop))*bezierDiff;
  float endAngleTopY = endY + sin(radians(endAngleTop))*bezierDiff;

  // calculate end's bottom control point 
  float endAngleBottomX = endX + cos(radians(endAngleBottom))*bezierDiff;
  float endAngleBottomY = endY + sin(radians(endAngleBottom))*bezierDiff;

  if (verbose) {
    // if true draw point and control points
    noStroke();
    fill(255,0,0);
    ellipse(startX, startY, controlPointDiameter, controlPointDiameter);
    ellipse(startAngleTopX, startAngleTopY, controlPointDiameter, controlPointDiameter);
    ellipse(startAngleBottomX, startAngleBottomY, controlPointDiameter, controlPointDiameter);
    ellipse(endAngleTopX, endAngleTopY, controlPointDiameter, controlPointDiameter);
    ellipse(endAngleBottomX, endAngleBottomY, controlPointDiameter, controlPointDiameter);
    ellipse(endX, endY, controlPointDiameter, controlPointDiameter);
    noFill();
    stroke(0);
  }

  // draw petal shape with points and control points
  beginShape();
  vertex(startX, startY);
  bezierVertex(startAngleTopX, startAngleTopY, endAngleTopX, endAngleTopY, endX, endY);
  bezierVertex(endAngleBottomX, endAngleBottomY, startAngleBottomX, startAngleBottomY, startX, startY);
  endShape();
}

// create PNG image of complete flower
void keyPressed() {
  if (key =='c' || key == 'C') {
    save ("flower_maker_v2.png");
  }
}








