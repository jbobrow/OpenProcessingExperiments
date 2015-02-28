
//my color spring
//By:Xinhan Yen,Email:archi730@hotmail.com
float xstart, xnoise, ystart, ynoise;

void setup() {
  size(1000, 600, P3D);
  background(255);
}
void draw() {
  translate(0,80,-50);
  background(0, 85, 152);
  xstart += 0.005;
  ystart += 0.005;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;
      noStroke();
      flora(x, y, noise(xnoise, ynoise));
      boxesGN(x+25, y+25, noise(xnoise, ynoise));
    }
  }
}
void flora(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y+100, y*1.5);
  float SizeX = 250*noiseFactor ;
  float SizeY = 250*noiseFactor ;
  float R = 30 + random(5, 175);
  float G = 75 + random(5, 175);
  float B = 45 + random(5, 175);
  fill(R, G, B);
  box(SizeX*0.05, 25, SizeY*0.75);
  ;
  popMatrix();
}

//
void boxesGN(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x+20, y+100, y*1.5);
  float SizeX = 250*noiseFactor ;
  float SizeY = 250*noiseFactor ;
  float R = 50+ (noiseFactor * 80);
  float G = 120+ (noiseFactor * 100);
  float B = 75+ (noiseFactor * 80);

  fill(R, G, B);
  box(SizeX*0.1+10, 30, SizeY*0.8);
  popMatrix();
}



