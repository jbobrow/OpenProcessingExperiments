
float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  smooth();
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
    if (keyPressed) {
      saveFrame("cloud.jpg");
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(720));
  float edgeSize = noiseFactor * 55;
  float grey = 150 + (noiseFactor*120);
  float alph = 150 + (noiseFactor*120);
  noStroke();
  fill(grey, alph);
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}


