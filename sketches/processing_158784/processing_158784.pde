
//import processing.opengl.*;

float xstart, xnoise, ystart, ynoise;
int boxSize = 40;

void setup() {
  //size(1920,1080);
  size(1024,768);
  smooth();
  background(0);
  frameRate(24);
  
  xstart = random(10);
  ystart = random(10);
}

void draw () {
  background(0);

  xstart += .01;  
  ystart += .01;
  
  xnoise = xstart;
  ynoise = ystart;
  
  for (int y = 0; y <= height; y+=boxSize) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=boxSize) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  } 
}

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x,y);
  //rotate(noiseFactor * radians(540));
  //noStroke();
  //float edgeSize = noiseFactor * 35;
  //float grey = 150 + (noiseFactor * 120);
  float alph = 50 + (noiseFactor * 205);
  fill(#4e3753, alph);
  //stroke(#4e3753, (255-alph));
  //strokeWeight(2);
  noStroke();
  rect(0,0, (boxSize-1), (boxSize-1));
  popMatrix();
}



