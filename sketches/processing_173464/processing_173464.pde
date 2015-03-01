
float xstart, xnoise, ystart, ynoise;

void setup() {
  size(500, 500);
  smooth();
  background(0);
  frameRate(10);
  xstart = random(10);
  ystart = random(10);
}

void draw () {
  background(255,255,255,100);
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
  translate(x,y);
  rotate(noiseFactor * radians(100));
  noStroke();
  float edgeSize = noiseFactor * 35;
  fill(random(255),random(255),random(255), random(100,255));
  ellipse(0,0, edgeSize*2+50, edgeSize/2);
}
