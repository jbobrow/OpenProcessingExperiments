
//praticeM,by chen, wu-zhi
//noise practice
//reference to my dear teacher

float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      //drawPoint1(x, y, noise(xnoise, ynoise));
      //drawPoint2(x, y, noise(xnoise, ynoise));
      drawPoint3(x, y, noise(xnoise, ynoise));
    }
  }
}


void drawPoint1(float x, float y, float noiseFactor) {
  int alph = int(255 * noiseFactor);
  stroke(0, alph, alph, alph);
  line(x, y, x+1, y+1);
}

void drawPoint2(float x, float y, float noiseFactor) {
  float len = 10 * noiseFactor;
  int alph = int(255 * noiseFactor);
  stroke(0, alph, alph, alph);
  rect(x, y, len, len);
}

void drawPoint3(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  int alph = int(255 * noiseFactor);
  stroke(0, alph, alph, alph);
  line(0, 0, 20, 0);
  popMatrix();
}  



