
//Noise animation practice
//Stella Wang, Tainan, 2013/11/6

float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  background(255);
  frameRate(24);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=3) {
    ynoise += 0.01;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=10) {
      xnoise += 0.01;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float grey = 150 + (noiseFactor*120);
  float alph = 150 + (noiseFactor*120);
  noStroke();
  fill(grey, alph);
  ellipse(0, 0, edgeSize, edgeSize/2);
  popMatrix();
}

