
float xstart, xnoise, ynoise;
void setup() {
  size(400, 400);
  smooth();
  background(106,21,6);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=1.5) {
    ynoise += 0.01;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=1.5) {
      xnoise += 0.01;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(360));
  stroke(147,78,4,150);
  strokeWeight(1);
  line(0, 0, 20, 0);
  stroke(233, 255, 0, 50);
  strokeWeight(1);
  line(0.2, 0.2, 30, 0.2);
  stroke(6,84,142,170);
  strokeWeight(1);
  line(0.1, 0.1, 10, 0.1);
  popMatrix();
}

void keyPressed() { 

  saveFrame("terrain-####.jpg");
} 


