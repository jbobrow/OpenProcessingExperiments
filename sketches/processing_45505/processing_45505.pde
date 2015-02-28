
/*
Author: Anita Chen
 Purpose: in class exercise "noisy spirals"
 Concept: Restlessness
 Reference: 1.Noisy Spirals, Noisy Circles, and 100 Spirals. Exercises provided in class by:schien@mail.ncku.edu.tw
            2.radius change by:http://abandonedart.org/?p=276
 */
void setup() {
  size(500, 500);
  background(0);
  smooth();
  noFill();
  // noLoop();
  frameRate(8);
}


float radius = random (5);
float radiusChange=-0.2;

void draw() {
  // refresh background
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  // set center point and color change and radiusChange
  int centX = mouseX;
  int centY = mouseY;
  if (radius>width/2) {
    radiusChange=-0.2;
  }
  if (radius<0) {
    radiusChange=+0.2;
  }

  // draw the circle in steps
  float x, y;
  float radiusNoise=random(10);
  float  thisRadius, rad;
  beginShape();
  strokeWeight(random(8));
  stroke(mouseX, mouseY, random(255),random(50,255));
  for (float ang=0; ang<=360*2; ang+=2) { 
    radiusNoise += 0.1;
    radius+=radiusChange;
    thisRadius = radius+(noise(radiusNoise)*30);
    rad = radians(ang);                                  
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad)); 
    // the code that really form part of a circle
    curveVertex(x, y);
  }
  endShape();//join beginpoint and endpoint
}
void keyPressed() {
  saveFrame("noisy spirals.jpg");
}


