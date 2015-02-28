
//praticeM,by chen, wu-zhi
//noise practice
//reference to my dear teacher:Sheng-Fen Nik Chien

float xstart, xnoise, ystart, ynoise, noiseFactor;
int radius = 90;

void setup() {
  size(750, 450, P3D);
  frameRate(24);
  smooth();
  sphereDetail(8);
  xstart = random(0.5);
  ystart = random(0.5);
}

void draw() {
  background(200);
  xstart += 0.005;
  ystart += 0.005;
  xnoise = xstart;
  ynoise = ystart;

  for (int y = 0; y <= height; y+=20) {
    ynoise += 0.05;
    xnoise = 3*xstart;
    for (int x = 0; x <= width; x+=20) {
      xnoise += 0.05;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  float edgeSize = noiseFactor * 50;
  float R = 5 + (noiseFactor * 90);
  float G = 75 + (noiseFactor * 90);
  float B = 5 + (noiseFactor * 90);
  int alph = 10 +(noiseFactor *30);
  rotateX(frameCount * 0.000007);
  rotateY(frameCount * 0.000005);  
  rotateZ(frameCount * 0.00001);
  pushMatrix();
  translate(x, y, 0);
  rotateX(frameCount * 0.05);
  rotateY(frameCount * 0.01);  
  rotateZ(frameCount * 0.001);
  rotate(noiseFactor * radians(300*PI));
  strokeWeight(12.5);
  stroke(20*R, 2*G, B/3, 5*alph);
  point(edgeSize/2, 1.5*edgeSize);
  fill(R, G, B, alph);
  rect(-1.5*edgeSize, -1.5*edgeSize, edgeSize, edgeSize);
  stroke(100);
  noFill();
  line(-1.5*edgeSize, -1.5*edgeSize, 1.5*edgeSize, 1.5*edgeSize);
  popMatrix();
}



