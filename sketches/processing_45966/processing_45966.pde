
float xstart, xnoise, ynoise;
void setup() {
  size(500, 500);
  smooth();
  background(144,199,97);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=2) {
    ynoise += 0.2;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=2) {
      xnoise += 0.2;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(100));
  stroke(random(50), 75);
  line(0, 0, 20, 0);
  popMatrix(); 
}

void keyPressed() { 
  saveFrame("grass.jpg"); 
} 


