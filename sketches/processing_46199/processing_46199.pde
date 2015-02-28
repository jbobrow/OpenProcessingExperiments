
//author:Robertlun,ncku arch
//purpose: homework,expressing feeling og spring
//concept: It's like clouds fly over the moutains.
//         And you can change the color of landscape 
//         by moving the mouse left or right.
//reference: from the teacher:Sheng-Fen Nik Chien

import processing.opengl.*;
float xstart, xnoise, ystart, ynoise; 
void setup() {
  size(600, 360, OPENGL);
  background(0);
  sphereDetail(8);
  noStroke();
  xstart = random(10); 
  ystart = random(10);
}
void draw() {
  frameRate(5);

  background(12+mouseX/2, 112-mouseX/6, 1+mouseX);
  xstart -= 0.01;
  ystart += 0.02;
  xnoise = xstart;
  ynoise = ystart;

  for (int y = 0; y <= height; y+=5) { 
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y, y);

  float h = noiseFactor * 30;
  float w = noiseFactor * 70;
  float g = 160 + (noiseFactor*160);
  float alph = 0.5 + (noiseFactor*50);
  stroke(42, 192, 255, 10);
  strokeWeight(5);
  fill(g, alph);
  ellipse(1, 1, h, w);
  popMatrix();
}


