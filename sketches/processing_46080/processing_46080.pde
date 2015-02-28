

float xstart, xnoise, ystart, ynoise;

void setup() {
  
  size(300, 500);
  smooth();
  background(5, 59, 7);
  frameRate (3);
  xstart = random(50);
  ystart = random (50);
}

void draw () {
  background(5, 59, 7);
  xstart += 0.005;
  ystart += 0.005;
  xnoise = xstart;
  ynoise = random(50);

  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.2;
    xnoise = xstart;

    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.2;

      fill (6, 160, 12);
      noStroke ();

      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  float len = 8 * noiseFactor;
  ellipse(x, y, len, len);
}


