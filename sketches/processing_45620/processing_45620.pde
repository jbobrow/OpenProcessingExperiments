
float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  smooth();
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.2;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.2;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

int r=255;  

int g=255;  

int b=255; 

void drawPoint(float x, float y, float noiseFactor) {
  r=floor(random(255));
  g=floor(random(255));
  b=floor(random(255));
  float len = 10 * noiseFactor;
  stroke(0);
  strokeWeight(0.1);
  fill(r, g, b, 80);
  rect(x, y, len, len);
}

void keyPressed() {  

  saveFrame("mosaic-####.jpg");  

}  



