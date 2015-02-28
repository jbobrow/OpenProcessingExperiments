
// Recession (with noise added) by Clair Dunn - September, 2013
// a modification of Matt Pearson's example code
// on page xxiii of his book, Generative Art.

int cr = int(random(255)), cg = int(random(255)), cb = int(random(255));
float xstart, ystart, squaresize; 
int timeFlag = 0;

void setup() {
  size(500, 500);
  background(0);

  xstart = random(10);
  ystart = random(10);

  squaresize = height/8;
}

void draw() {
  frameRate (20);

  xstart += 0.02;
  ystart += 0.01;

  translate(width/2, height/2);

  float ynoise = ystart;
  for (float y = -squaresize; y <= squaresize; y+=3) {
        ynoise += 0.05;
    float xnoise = xstart;
    for (float x = -squaresize; x <= squaresize; x+=3) {
          xnoise += 0.05;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }

  if (millis() >= timeFlag + 500) {
    timeFlag=millis();
  }
  if (frameCount > 2000) { // 20 seconds * 25 fps = 500
    noLoop();
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 4, y * noiseFactor * 4);
  float edgeSize = noiseFactor * 20; 
  stroke (0, 0, 0);
  rectMode(CORNER);
  fill(random(104));
  rect(0, 0, edgeSize, edgeSize);
  cr = int(random(255)); 
  cg = int(random(127)); 
  cb = int(random(255));
  stroke(cr, cg, cb);
  triangle (0, 0, edgeSize, edgeSize, 35, 60);
  if ( (x >300) && (y < -200) ) {
    line(x, y, 500, 500);
  }
  popMatrix();
}
