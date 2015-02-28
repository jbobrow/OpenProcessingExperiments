
void setup() {
  size(300,300);
smooth();
background(255);
float xstart = random(10);
  float xnoise = xstart;
  float ynoise = random(10);
  for (int y = 0; y <= height; y += 10) {
    ynoise += 0.15;
    xnoise = xstart;
    for (int x = 0; x <= width; x += 10) {
      xnoise += 0.15;
      
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  float len = 10 * noiseFactor;
  ellipse(2*x, 5*y, len, len);
  //rect(x, y, len, len);
   stroke(random(255), random(200), random(70));

}

