
//Mocy cross the see
//by Xinhan Yen ,Emai:archi730@hotmail.com
float xstart, xnoise, ystart, ynoise;
void setup() {
  size(1000, 600, P3D);
  background(0);
  sphereDetail(8);
  noStroke();
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  background(0);
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
  pushMatrix();
  translate(x, y+100, y*1.5);
  float SizeX = mouseY*noiseFactor * 0.1;
  float SizeY = mouseX*noiseFactor * 0.1;

  float R = 4 + (noiseFactor * 120);
  float G = 67 + (noiseFactor * 120);
  float B = 100 + (noiseFactor * 120);
  //float alph = 150 + (noiseFactor * 120);
  fill(R, G, B, 99);
  box(SizeX*0.1, 10, SizeY*0.5);
  popMatrix();
}



