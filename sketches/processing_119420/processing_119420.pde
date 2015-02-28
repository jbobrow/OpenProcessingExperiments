


float xstart, xnoise, ystart, ynoise;
void setup() {
  size(500, 300, P3D);
  background(0);
  sphereDetail(8);
  noStroke();
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  translate(0, 0, 0);
  rotateY(frameCount * 0.01);
  rotateX(frameCount * 0.01);
  background(0);
  xstart += 0.1;
  ystart +=0.1;
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
  pushMatrix();
  translate(x, 300-y, -y/4);
  float sphereSize = noiseFactor * 7;
  float grey = 150 + (noiseFactor * 120); 
  float alph = 150 + (noiseFactor * 120); 
  fill(grey, grey, random(255), alph);
  
  sphere(sphereSize*random(0.8));
  fill(random(200,255), random(255));
  box(sphereSize,sphereSize,sphereSize*3);
  popMatrix();
}



