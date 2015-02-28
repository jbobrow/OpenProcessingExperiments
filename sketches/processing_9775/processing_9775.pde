
/*

 Title: Flower Maker
 Author: Ray Elder
 Version: 2.0
 Date: 17 May 2010
 Modified: 14 January 2014
 Description: Function to draw multiple flowers using translate().

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
  translate(width/2, height/2);
  drawFlower();
}

void drawFlower() {
  int centerX = 0;
  int centerY = 0;
  int diameter = radius * 2;
  if (verbose) {
    // if true draw center point
    noStroke();
    fill(255, 0, 0);
    ellipse(centerX, centerY, controlPointDiameter, controlPointDiameter);
  }
  noFill();
  stroke(0);
  // draw center ellipse of the flower
  ellipse (centerX, centerY, diameter, diameter);
  
  // calculate rotation angle based on the number of petals and set to radians
  float angle = radians(360 / totalPetals);
  for (int i = 0; i < totalPetals; i++) {
    
    // call drawPetal function to calculate control points and set bezierVertices
    drawPetal(centerX, centerY + radius);
    
    // increment angle based on total number of petals
    rotate(angle);
  }

}

void drawPetal(int startX, int startY) {

  // set offset for control points
  float bezierDiff = petalLength / 3;

  // calculate start's top control point
  float startAngleTopX = startX + bezierDiff;
  float startAngleTopY = startY + bezierDiff;

  // calculate start's bottom control point 
  float startAngleBottomX = startX - bezierDiff;
  float startAngleBottomY = startY + bezierDiff;

  // calculate end point
  float endX = startX;
  float endY = startY + petalLength; 

  // calculate end's top control point 
  float endAngleTopX = endX + bezierDiff;
  float endAngleTopY = endY - bezierDiff;

  // calculate end's bottom control point 
  float endAngleBottomX = endX - bezierDiff;
  float endAngleBottomY = endY - bezierDiff;

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
    save ("flower_maker_v1.png");
  }
}


