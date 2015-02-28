
/*
1106 3d led
moving led like

by kokfu lok
*/
float xstart, xnoise, ystart, ynoise;
void setup() {
  size(500, 300, P3D);
  background(0);
  sphereDetail(10);
  noStroke();
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  background(0,10);
  translate(mouseX,mouseY,noise(height));
  rotateZ(frameRate*.035);
  rotateX(sin(second()));
  rotateY(noise(frameRate)*0.001);
  xstart += 0.05;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=60) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.11;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, 250-y, -y);

  float sphereSize = noiseFactor * 55;
  float grey = 150 + (noiseFactor * 120);
  float alph = 150 + (noiseFactor * 120);
  fill(random(200,255),random(100,255),0, alph);
  sphere(sphereSize);
  popMatrix();
}



