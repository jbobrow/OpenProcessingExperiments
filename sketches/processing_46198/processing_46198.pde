
float xstart, xnoise, ynoise;
void setup() {
  size(400, 400);
  smooth();
  background(255);
  xstart = random(40);
  xnoise = xstart;
  ynoise = random(40);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.07;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.07;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}



void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 60; 
  float grey = 150 + (noiseFactor*150); 
  float alph = 0.5 + (noiseFactor*50);
  stroke(255, 121, 188, 10);
  strokeWeight(10);
  fill(grey, alph);
  ellipse(0, 0, edgeSize*3, edgeSize*3); 
  popMatrix();
}

void keyPressed() {
  saveFrame("cottoncandy-####.jpg");
}


