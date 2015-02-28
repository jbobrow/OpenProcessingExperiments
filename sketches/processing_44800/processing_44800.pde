
/*
 Author: mohan
 Purpose:Flowering Flowers
 Concept:Kaleidoscope
 Kaleidoscope will change along with mouseX.
 */

void setup() {

  size(500, 500);
  background(0);
  strokeWeight(1);
  smooth();
  frameRate (15);
  // noLoop();
}

void draw() {
  float radius = 100;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float centX = 250;
  float centY = 250;
  float radiusNoise = random(10);
  float noiseval = random(5);
  float radVariance, thisRadius, rad;

  float layers = random(5, 10);
  for (int i=0;i<layers;i++) {
    beginShape();
    for (float ang=0; ang<=360*1; ang+=0.85) {
      noiseval += 0.1;
      radVariance=30*customNoise(noiseval);
      thisRadius = radius+radVariance+ (noise(radiusNoise)*200)-100;
      rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    stroke(random(255), random(200), random(70), 60);
    fill(255);
  }

  float m = mouseX;
  float k=60;
  float a, b = random(30);
  for (int theta=0; theta<360*m; theta+=mouseX) {
    a = 300.0* sin(k*theta*PI/180.0) * cos(theta*PI/180.0);
    b = 300.0* sin(k*theta*PI/180.0) * sin(theta*PI/180.0);
    vertex((int)(a+width/2), (int)(height/2-b));
  }

  endShape();
}

float customNoise(float value) {
  float retValue=pow(sin(value), 3);
  return retValue;
}


