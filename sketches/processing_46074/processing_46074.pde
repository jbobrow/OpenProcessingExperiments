
float xstart, xnoise, ynoise;
void setup() {
  size(300, 300);
  smooth();
  background(255);
  xstart = random(10);
  xnoise = xstart;
  ynoise = random(10);
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.1;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.1;

      drawPoint(x, y, noise(xnoise, ynoise));
     
  }
  
  }
  
}

float t=second();


void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x, x);
  rotate(noiseFactor * radians(360));
  stroke(random(255),30,30, 150);
  
  line(0, 0, 100, 0);
  
  popMatrix();
  stroke(30,random(255),30,150);
   pushMatrix();
  translate(y, x);
  rotate(noiseFactor * radians(180));

  
  line(0, 0, 100, 0);
  popMatrix();
}



