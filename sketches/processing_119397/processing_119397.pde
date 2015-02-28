
//Kang-Yu,Liu
//exercise noise grid
//20131106

float xstart, xnoise, ynoise;
void setup() {
  size(250, 500);
  frameRate(2);
}

void draw() {
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.3;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.3;
      drawPoint(x, y, noise(xnoise, ynoise)/3);
     drawLine(x,y,noise(xnoise,ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  float len = 10 * noiseFactor;
  int alph = int(255 * noiseFactor);
  stroke(40, 79, 158, alph);
  strokeWeight(random(0, 8));
  fill(160, 187, 239);
  rect(x, y, len, len);
}
void drawLine(float x1, float y1, float noiseFactor1) {
  pushMatrix();
translate(x1, y1);
rotate(noiseFactor1 * radians(360));
stroke(30, 12);
line(0, 0, 20, 0);
popMatrix();
}



