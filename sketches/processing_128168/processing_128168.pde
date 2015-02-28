
/*
  Title: Circles Procedural
  Author: Ray Elder
  Date: 14 January 2013
  Description: Based on Conditional Design project by Erin, Hayden and McKenzie.
*/

Boolean createPDF = false;

// import PDF library
import processing.pdf.*;

// set start diameter
float startDiameter = 100;

// build an array of colors
color[] penColors = {color(0,0,0), color(255,0,0), color(0,255,0), color(0,0,255)};

void setup() {
  // set sketch width and height
  if (createPDF) {
    size(500, 500, PDF, "circles_procedural.pdf");
  } else {
    size(500, 500);
  }
  // set sketch background color
  background(255, 255, 255);
  // prevent continuous screen redrawing 
  noLoop();
}

void draw () {
  for (int i = 0; i < penColors.length; i++) {
    float startX = random(width);
    float startY = random(height);
    float diameter = startDiameter + 25 * i;
    drawCircles(startX, startY);
  }
  if (createPDF) {
    println("PDF Saved");
    exit();
  }
}
void drawDot(float xPos, float yPos) {
  noStroke();
  fill(0,0,0);
  ellipse(xPos, yPos, 5, 5);
}

void drawCircles(float xPos, float yPos) {
  
  drawDot(xPos, yPos);
  
  noFill();
  strokeWeight(1);
  
  float startDiameter = random(width/2);
  
  for (int i = 0; i < penColors.length; i++) {
    stroke(penColors[i]);
    float diameter = startDiameter + 25 * i;
    ellipse(xPos, yPos, diameter, diameter);
  }
}


