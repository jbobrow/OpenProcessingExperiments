
// practice on moving clouds
// by chen-hsin chang

float xstart, xnoise, ystart, ynoise;
void setup() {
  size(500, 300);
  background(0);
  frameRate(24);
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  background(0);
  xstart += 0.01;
  ystart += 0.01;
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
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  float len = 10 * noiseFactor;

  stroke(x, x, y, y);
  fill(y, 0, y, alph);
  rect(x, y, len, len);
  stroke(100, y);
  line(x, y, x+10, y+10);
  // ellipse(0, 0, edgeSize, edgeSize/2);
  popMatrix();
}

/* 
 void drawPoint(float x, float y, float noiseFactor) {
 float len = 10 * noiseFactor;
 rect(x, y, len, len);
 }
 */
/*
void drawPoint(float x, float y, float noiseFactor) {
 pushMatrix();
 translate(x, y);
 rotate(noiseFactor * radians(360));
 stroke(0, 150);
 line(0, 0, 20, 0);
 popMatrix();
 }
 */


