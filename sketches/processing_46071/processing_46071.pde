
float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  smooth();
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=3) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=3) {
      xnoise += 0.1;

      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  float len = 10 * noiseFactor;
  fill (30, pow(len, 3), 50);
  rect(x, y, len, len);
}

void keyPressed() { 

  saveFrame("green.jpg");
}


