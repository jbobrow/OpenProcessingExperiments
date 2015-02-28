
/*
Author: Anita Chen
Purpose: in class exercise "noisy circles on demand"
Concept: Wand
Reference: 1.Noisy Spirals, Noisy Circles, and 100 Spirals. Exercises provided in class by:schien@mail.ncku.edu.tw
           2.radius change by:http://abandonedart.org/?p=276
*/
void setup() {
  size(500, 500);
  background(0);
  smooth();
  strokeWeight(0.5);
  noFill();
  frameRate(20);
}

float radius = 0;
int radiusChange=-1;

void draw() {
  // refresh background
  noStroke();
  fill(0, 25);
  rect(0, 0, width, height);
  // set center point and color change and radiusChange
  int centX = mouseX;
  int centY = mouseY;
   radius+=radiusChange;
  if (radius>width/5) {
    radiusChange=-2;
  }
  if (radius<0) {
    radiusChange=+2;
  }
  
  // draw the circle in steps
  float x, y;
  float noiseval=random(10);
  float radVariance, thisRadius, rad;

  beginShape();
  stroke(mouseX, mouseY, mouseY-mouseX);
  for (float ang=0; ang<=360; ang+=1) { 
    noiseval += 0.1;
    radVariance=random( 30)*customNoise(noiseval);
    thisRadius = radius+radVariance;
    rad = radians(ang);                                  
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad)); 
    // the code that really form part of a circle
    curveVertex(x, y);
  }
  endShape(CLOSE);//join beginpoint and endpoint
}
//customed noise function
float customNoise(float value) {
  int count = int(value%(random (15)));
  float retValue = pow(sin(value), count);
  return retValue;
}
void keyPressed() {
 saveFrame("noisy circles on demand.jpg");
 }

