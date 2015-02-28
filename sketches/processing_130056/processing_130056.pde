
/*
moving cloud
fall the water fall
in-class exercises
by KokFu Lok
*/


float xstart, xnoise, ystart, ynoise;
void setup() {
  size(500, 500);
  background(0);
 // frameRate(24);
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  
  background(noise(100),noise(100),50);
  xstart += 0.2;
  ystart += 0.6;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= width; y+=5) {
    ynoise -= 0.1;
    xnoise = xstart;
    for (int x = 0; x <= height; x+=5) {
      xnoise += 10.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float blue = 150 + (noiseFactor * 120);
  float alph = 50 + (noiseFactor * 10);
  noStroke();
  fill(100,100,blue, alph);
  ellipse(0, 0, edgeSize+random(20), edgeSize/2);
  popMatrix();
}



