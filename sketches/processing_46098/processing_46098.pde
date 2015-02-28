
/*
 Author: Anita Chen
 Purpose: Assignment-5 "Spring"
 concept: Breath of spring.Spring air is full of greenery and vibrant flavor.
 Reference: Processing Handbook p.539-540.
 */
float xstart, xnoise, ystart, ynoise, zstart, znoise;
float xstartNoise, ystartNoise, zstartNoise;
void setup() {
  size(400, 400, P3D);
  smooth();
  background(mouseX, mouseY, mouseY);
  frameRate(5);
  xstartNoise=random(20);
  ystartNoise=random(20);
  zstartNoise=random(20);
  xstart = random(10);
  ynoise = random(10);
  znoise = random(10);
}
void draw() {
  background(mouseX, mouseY, mouseY);
  camera(0, mouseY, 220, 0, 0, 0, 0, 1, 0);
  xstartNoise+=0.01;
  ystartNoise+=0.01;
  zstartNoise+=0.01;
  xstart +=(noise(xstartNoise)*0.2)-0.1;
  ystart +=(noise(ystartNoise)*0.2)-0.1;
  zstart +=(noise(zstartNoise)*0.2)-0.1;
  xnoise = xstart;
  ynoise = ystart;
  for (int z=-200;z<=200;z+=10) {
    znoise+=0.1;
    ynoise+=ystart;
    for (int y = -200; y <=200; y += 20) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x =-200; x <=200; x +=20) {
        xnoise += 0.1;
        drawPoint(x, y, z, noise(xnoise, ynoise, znoise));
      }
    }
  }
}
void keyPressed() {
  saveFrame("spring.jpg");
}
void drawPoint(float x, float y, float z, float noiseFactor) {
  int alph= int(80*noiseFactor)+20;
  int w= int (3*noiseFactor);
  float len = 8 * noiseFactor;
  color strokeCol=color(130*noiseFactor, 255*noiseFactor, random(255)*noiseFactor);
  pushMatrix();
  translate(-width/10, -height/30, 0);
  rotate(random(255)*noiseFactor * radians(500));
  stroke(strokeCol, alph);
  strokeWeight(w);
  fill(242, 204, 47, alph);
  rect(x, y, len, len);
  //sphere(len);
  //line(x,y,0,5,0,20);
  popMatrix();
}


