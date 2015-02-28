
//uncomment out to save framesfloat xStart, xNoise, yNoise;

void setup () {
  size(533, 300);
  background(255);
  rectMode(CENTER);
  smooth();
}

void draw() {
  for (int y = -50; y<=height;y+=10) {
//    saveFrame("noise-####.tif"); //uncomment out to save frames
    yNoise +=0.1+(random(.5));
    xNoise = random(map(y, -50, width, 0, 255));
    for (int x = -50;x<=width;x+=10) {

      xNoise +=0.1+(random(.5));
      stroke(0, 255);
      fill(random(yNoise)+yNoise*2, random(xNoise)+xNoise*2, random(yNoise)+xNoise*2, 10);
      stroke(0, map(y, -50, width, 0, 255)-100);
//      saveFrame("noise2-####.tif"); //uncomment out to save frames
      drawPoint(round(random(width)), round(random(height)), noise(xNoise, yNoise));
      yNoise = random(map(x, -50, width, 0, 255));
    }
  }

  xStart = random(100);
  int y = round(random(-50, height));
  int x = round(random(-50, width));
}

void drawPoint(float x, float y, float noiseCX) {
  for (int j=0; j<=100;j++) {
    float l = 30*noiseCX+(random(1000)/j+10);
    rect(x, y, l, l);
  }
}

