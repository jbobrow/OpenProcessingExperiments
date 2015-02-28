
float xstart, ystart, squaresize;

void setup() {
  size(580, 580);
  background(150);
  xstart = random(10);
  ystart = random(10);
  squaresize = height/4;

}

void draw() {
  fill(150, 150, 150, 15);
  noStroke();
  rect(0, 0, width, height);

  

  xstart += 0.02;
  ystart += 0.01;

  translate(width/2, height/2);
  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=10) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=10) {
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4);
  float edgeSize = noiseFactor * 40;
  stroke(0, 50);
  fill(255, 200);
  rect(0, 0, edgeSize, edgeSize);
  popMatrix();
}


