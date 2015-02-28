
//Clark Li
//Rainning day
//It look like the image when the water on the ground

float xstart, ystart,xnoise, ynoise;
void setup() {
  size(400, 400);
  background(random(150));
  frameRate(100);
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  background(random(150));
  xstart+=0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;

  for (int y = 0; y <= height; y+=1) {
    ynoise += 0.01;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=1) {
      xnoise += 0.01;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(random(noiseFactor * radians(540)));
  float edgeSize = noiseFactor * 35;
  float grey = 150 + (noiseFactor*200);
  float alph = 150 + (noiseFactor*120);
  noStroke();
  fill(noiseFactor*grey, alph);
  ellipse(random(50), random(100), random(edgeSize), edgeSize/2);
  popMatrix();
}



