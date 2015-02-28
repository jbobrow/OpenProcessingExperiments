
//practice drawing
//spring image
//MAVIES 
float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  smooth();
  background(249, 235, 64);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=3) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=3) {
      xnoise += 0.05;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(540));
  float edgeSize = noiseFactor * 35;
  float grey = 188 + (noiseFactor*120);
  float alph = 200 + (noiseFactor*120);
  noStroke();
  fill(228, 0, 127, 10);
  ellipse(0, 0, edgeSize, edgeSize/2);
  translate(x, y);
  rotate(noiseFactor * radians(360));
  //stroke(255,80);
  stroke(98, 101, 173, 100);  
  // the image is about the plume or a willow
  //if (mousePressed){  
  //stroke(33, 180, 141, 100);  
  //use if (mousePressed) try to change the stroke solor but it did't work
  line(0, 10, 20, 15);
  popMatrix();
  }
  void keyPressed() {
  saveFrame("cottoncandy-####.jpg");
}


