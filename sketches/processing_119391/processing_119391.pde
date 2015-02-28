
/*
1106 class
Two dimensional noise

changing the xnoise and color

by kokfu lok
*/

float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  background(255);
  frameRate(2);
}

void draw() {
  xstart = random(100);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=1) {
    ynoise += .01;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=1) {
      xnoise += 1.01;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  int alph = int(255 * noiseFactor);
  stroke(100* noiseFactor, random(114)* noiseFactor, 115* noiseFactor, alph);
  line(x, y, x+1, y+1);
}



