
/*
 Author: Anita Chen
 Purpose: in class exercise "3D noise"
 
 */
float xstart, xnoise, ystart, zstart, ynoise, znoise;
float xstartNoise, ystartNoise;
float changesize=width/4;
void setup() {
  size(320, 320, P3D);
  smooth();
  background(0);
  frameRate(24);
  xstartNoise=random(20);
  ystartNoise=random(20);
  xstart = random(10);
  ynoise = random(10);
  zstart = random(10);
}
void draw() {
  background(0);
  //camera(0,mouseY/2, 220, 0, 0, 0, 0, 2, 0);
  translate(width/2, height/2, -height);
  rotateX(mouseY);
  xstartNoise+=0.01;
  ystartNoise+=0.01;
  xstart +=(noise(xstartNoise)*0.2)-0.1;
  ystart +=(noise(ystartNoise)*0.3)-0.1;
  xnoise = xstart;
  ynoise = ystart;
  znoise = zstart;
  for (int z=0;z<=height/2;z+=5) {
    znoise += 0.1;
    ynoise = ystart;
    for (int y = -80; y <= 80; y += 3) {
      ynoise += 0.1;
      xnoise = xstart;
      for (int x = -80; x <= 80; x +=3) {
        xnoise += 0.1;
        drawPoint(x, y, z, noise(xnoise, ynoise, znoise));
      }
    }
  }
}
void keyPressed() {
  saveFrame("3D noise.jpg");
}
void drawPoint(float x, float y, float z, float noiseFactor) {
  int alph= int(130*noiseFactor)+20;
  int w= int (3*noiseFactor);
  float len = 10 * noiseFactor;
  color strokeCol=color(130*noiseFactor, 255*noiseFactor, random(255)*noiseFactor);
  pushMatrix();
  translate(x*4, y*4, 0);
  rotateX(noiseFactor * sin(200));
  stroke(strokeCol, alph);
  strokeWeight(w);
  fill(255, alph);
  rect(x, y, len, len);
  //box(len);
  popMatrix();
}


