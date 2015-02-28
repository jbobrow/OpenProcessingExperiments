
/*
 Author: mohan
 Purpose:Spring
 Concept:Enlivened of spring. Just like the Vibrant kite.
 */


import processing.opengl.*;
float xstart, xnoise, ystart, ynoise;
float xstartNoise, ystartNoise ;

 
void setup() {
 frameRate(25);
  size(800, 800, OPENGL);
  background(0);
  sphereDetail(16);
  noStroke();
  xstartNoise = random(10);
  ystartNoise = random(10);
   xstart = random(10);
  ystart = random(10);
   
}
void draw() {
  background(0);
  xstart += 0.01;
  ystart += 0.01;
  xstart +=(noise(xstartNoise)*0.05)-0.25;
  ystart +=(noise(ystartNoise)*0.05)-0.25;
  xnoise = xstart;
  ynoise = ystart;

  for (int y = 0; y <= mouseY; y+=45) {
    ynoise += 0.05;
    xnoise = xstart;
    for (int x = 0; x <= mouseX; x+=45) {
      xnoise += 0.05;
      drawPoint(x, -y+500, noise(xnoise, ynoise));
     
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x,600-y, -y+300);
  rotate(noiseFactor * radians(35));
  float sphereSize = noiseFactor * 55;
  float len = 5 * noiseFactor;
  rect(x-400, y+10, 5, 5);
  rect(x-400, y+100, 10, 10);
  rect(x-400, y-500, 5, 5);
  rect(x-400, y-600, 10, 10);
  fill(random(255), random(255), random(255));

  sphere(sphereSize);
  popMatrix();
}

