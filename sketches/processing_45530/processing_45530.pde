
/*
Author: Anita Chen
Purpose: in class exercise "100 noisy spirals in various locations"
Concept: Blooming
Reference: 1.Noisy Spirals, Noisy Circles, and 100 Spirals. Exercises provided in class by:schien@mail.ncku.edu.tw
           2.radius change by:http://abandonedart.org/?p=276
*/

int counter = 0;  // flower counter
void setup() {
  size(500, 500);
  background(255);
  smooth();
  background(0);
  //frameRate(20);
}
void draw() {
  // refresh the screen if more than 100 flowers drawn
  bigSpiral();
  if (counter > 100) {
    clearBackground();
    counter = 0;
  }
  littleSpiral();
  int n=int (random(10,150));
  delay(n);
  counter+=2;
}

//draw big flowers
void bigSpiral() {
  float radius =0;
  int radiusChange=-1;
  int centX = int (random(width));
  int centY =int (random(height));
  radius+=radiusChange;
  if (radius>width/2) {
    radiusChange=-2;
  }
  if (radius<0) {
    radiusChange=+2;
  }
  float x, y;
  beginShape();
  stroke(mouseX, mouseY, mouseY-mouseX);
  float radiusNoise = random(10);
  color strokeCol=color(255, 0, random(255), random(40, 100));
  stroke(strokeCol);
  strokeWeight (2);
  noFill();
  int startangle = int(random(360));                                  
  int endangle =  720 + int(random(360));                           
  int anglestep =1+ int (random(3));
  beginShape();
  for (float ang = startangle; ang <= endangle; ang += anglestep) {
    radiusNoise += 0.05;
    radius += 0.1;
    float thisRadius = radius + (noise(radiusNoise) * 100);
    float rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    curveVertex(x, y);
    strokeWeight (0);
    line(centX, centY, x, y);
    strokeWeight (2);
  }
  endShape();
}
//draw little flowers
void littleSpiral () {
  float x, y;
  int centX =int (random(width));
  int centY =int (random(height));
  float radiusNoise = random(10);
  float radius2 = 0;
  color strokeCol=color(random(100, 255), random(255), random(70));
  stroke(strokeCol);
  strokeWeight(0);
  fill(strokeCol, 80);
  int startangle = int(random(360));                                  
  int endangle =  720 + int(random(720));                           
  int anglestep =1+ int (random(3));
  beginShape();
  for (float ang2 = startangle; ang2 <= endangle; ang2 += anglestep) {
    radiusNoise += 0.05;
    radius2 += 0.01;
    float thisRadius = radius2 + (noise(radiusNoise) * 10);
    float rad2 = radians(ang2);
    x = centX + (thisRadius * cos(rad2));
    y = centY + (thisRadius * sin(rad2));
    curveVertex(x, y);
  }
  endShape();
}

void clearBackground() {
  noStroke();
  fill(0, 200);
  rect(0, 0, width, height);
}
void keyPressed() {
 saveFrame("hundred noisy spirals.jpg");
 }


