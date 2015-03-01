
float xstart, ystart, squaresize, squaresizeX, time, d;
int delay = 60;

void setup() {
  size(800, 600);
  background(0);
  xstart = random(10);
  ystart = random(10);
  squaresize = height/7;
  squaresizeX = width/7;
}

void draw() {
  time = map(frameCount, 0, delay, 0, 1);
  background(0);
  noStroke();

  //stroke(0);
  fill(255, 80);

  xstart += 0.02;
  ystart += 0.01;

  translate(width/2, height/2);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -squaresizeX; x <= squaresizeX; x+=3) {
      colorMode(HSB, 255, 100, 100);
      d = map(sin(0.02*dist(width/2+x, width/2+y, width/2, height/2) - TWO_PI*time), -1, 1, .5, 1);
      float f = map(sin(0.02*dist(width/2+x, width/2+y, width/2, height/2) - TWO_PI*time), -1, 1, 0, 150);
      fill(int(f), 90, 100);
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
      colorMode(RGB);
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {

  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4);
  float edgeSize = noiseFactor * 12;
  ellipse(0, 0, edgeSize*d, edgeSize*d);
  popMatrix();
}

