
// based upon:

// P_2_2_3_01.pde
//
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de

int formResolution = 10;
int stepSize = 5;
float distortionFactor = 1;
float initRadius = 100;
float centerX, centerY;
float[] x = new float[formResolution];
float[] y = new float[formResolution];
float a=25;

boolean filled = false;
boolean freeze = false;


void setup() {
  size(500, 500);
  smooth();
  background(255); 
  // init form
  centerX = width/2;
  centerY = height/2;
  float angle = radians(360/float(formResolution));
  for (int i=0; i<formResolution; i++) {
    x[i] = cos(angle*i) * initRadius;
    y[i] = sin(angle*i) * initRadius; 
  }
}


void draw() {
  
  initRadius += 3;

  // calculate new points
  for (int i=0; i<formResolution; i++) {
    x[i] += random(-stepSize, stepSize);
    y[i] += random(-stepSize, stepSize);
  }

  strokeWeight(stepSize/2.0);
  stroke(0, a);
  noFill();

  beginShape();
  // start controlpoint
  curveVertex(x[formResolution-1]+centerX, y[formResolution-1]+centerY);

  // only these points are drawn
  for (int i=0; i<formResolution; i++) {
    curveVertex(x[i]+centerX, y[i]+centerY);
  }
  curveVertex(x[0]+centerX, y[0]+centerY);

  // end controlpoint
  curveVertex(x[1]+centerX, y[1]+centerY);
  endShape();
  
  a -= 0.05;

  if (a==1) {
    noLoop();
  }
}


