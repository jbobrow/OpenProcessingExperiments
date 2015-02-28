
/*
 Author: Anita Chen
 Purpose: in class exercise "nested loops"
 
 */
float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  smooth();
  background(255);
  float xstart = random(10);
  float xnoise = xstart;
  float ynoise = random(10);
  for (int y = 0; y <= height; y += 3.8) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x +=3.8) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  //saveFrame("nestloops.jpg");
}
void drawPoint(float x, float y, float noiseFactor) {
  int alph= int(130*noiseFactor)+20;
  int w= int (4*noiseFactor);
  color strokeCol=color(55*noiseFactor, 22*noiseFactor, random(255)*noiseFactor);
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(strokeCol, alph);
  strokeWeight(w);
  line(0, 0, 25, 0);
  popMatrix();
}




