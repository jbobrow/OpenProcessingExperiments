
// P_2_2_3_01.pde
//
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de

int formResolution = 10;
int stepSize = 4;
float distortionFactor = 1;
float initRadius = 200;
float centerX, centerY;
float[] x = new float[formResolution];
float[] y = new float[formResolution];
float nx, ny, theta, a=25;

boolean filled = false;
boolean freeze = false;


void setup() {
  size(500, 300);
  smooth();
  background(20); 
  // init form
  centerX = width/2;
  centerY = height/2;

  float radius = initRadius * random(0.5, 5.0);
  float angle = random(PI);
  radius = initRadius*4;
  angle = 0;

  float x1 = cos(angle) * radius;
  float y1 = sin(angle) * radius;
  float x2 = cos(angle-PI) * radius;
  float y2 = sin(angle-PI) * radius;
  for (int i=0; i<formResolution; i++) {
    x[i] = lerp(x1, x2, i/(float)formResolution);
    y[i] = lerp(y1, y2, i/(float)formResolution);
  }
  
}


void draw() {
  
  fill(20,1);
  noStroke();
  rect(0,0,width, height);

  //initRadius += 2;

  // calculate new points
  for (int i=0; i<formResolution; i++) {
    //x[i] += random(-stepSize, stepSize);
    //y[i] += random(-stepSize, stepSize);
    //nx = map(noise(sin(theta)*2), 0, 1, -stepSize, stepSize);
    //ny = map(noise(cos(theta)*3), 0, 1, -stepSize, stepSize);
    nx = random(-stepSize, stepSize);
    ny = random(-stepSize, stepSize);
    x[i] += nx;
    y[i] += ny;
    //theta += 0.0523;
  }
  a = 200;
  strokeWeight(2);
  stroke(255, a);
  noFill();

  beginShape();
  // start controlpoint
  curveVertex(x[formResolution-1]+centerX, y[formResolution-1]+centerY);

  // only these points are drawn
  for (int i=0; i<formResolution; i++) {
    curveVertex(x[i]+centerX, y[i]+centerY);
  }
  //curveVertex(x[0]+centerX, y[0]+centerY);

  // end controlpoint
  curveVertex(x[1]+centerX, y[1]+centerY);
  endShape();
  
  filter(BLUR);
    
}


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("image-###.png");
  if (key == DELETE || key == BACKSPACE) background(255);

  if (key == '1') filled = false;
  if (key == '2') filled = true;
}

