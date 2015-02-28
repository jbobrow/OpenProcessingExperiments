
//praticeM,by chen, wu-zhi
//noise practice
//reference to my dear teacher:Sheng-Fen Nik Chien

float xstart, xnoise, ystart, ynoise;
void setup() {
  size(600, 600);
  background(150);
  //frameRate(10);
  xstart = random(10);
  ystart = random(10);
}
void draw() {
  background(255);
  xstart += 0.01;
  ystart += 0.01;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=20) {
    ynoise += 0.05;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=50) {
      xnoise += 0.05;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(250*PI));
  float edgeSize = noiseFactor * 60;
  float R = 50 + (noiseFactor * 90);
  float G = 20 + (noiseFactor * 90);
  float B = 90 + (noiseFactor * 90);
  int alph = 20 +(noiseFactor *90);
  strokeWeight(15);
  stroke(R, G, B, alph);
  fill(R, G, B, alph);
  line(0, 0, 10*edgeSize, edgeSize/2);
  popMatrix();
}



