
//Visualizing the noise as a rotation
//by Xinhan Yen,Email:archi730@hotmail.com
float xstart, xnoise, ynoise;
void setup() {
  size(600, 300);
  background(255);
}
void draw() {
  noLoop();
  //background(255);
  xstart=random(10);
  xnoise=xstart;
  ynoise=random(10);
  for (int y=0;y<=height;y++) {
    ynoise+=0.01;
    xnoise=xstart;
    for (int x=0;x<=width;x++) {
      xnoise+=0.01;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

//
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float R = 44+ (noiseFactor*120);
  float G = 182+ (noiseFactor*60);
  float B = 150+ (noiseFactor*120);
  //float alph = 150 + (noiseFactor*120);
  noStroke();
  fill(R, G, B,50);
  ellipse(0, 0, edgeSize, edgeSize*3/2);
  popMatrix();
}



