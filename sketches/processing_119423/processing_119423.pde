
float xstart, ystart, xnoise, ynoise;
void setup() {
  size(800, 450);
  background(255);
  frameRate(18);
  xstart=random(10);
  ystart=random(10);
}
void draw() {
  background(255);
  xstart += 0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;


  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
      drawPoint01(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  float len = 10 * noiseFactor;
  stroke(200, 80, 80, 20);
  fill(150+2*x, 150+2*y, 200, 20);
  rect(x, y, len, len);
 
}

void drawPoint01(float x, float y, float noiseFactor) {
  fill(150+2*y, 150+x, 200, 250);
  ellipse(x,y,4,4);
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(20+0.5*x, 20, 80, 50);
  line(0, 0, 50, 0);
  popMatrix();
}



