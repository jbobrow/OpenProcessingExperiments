
float xstart,xNoise,yNoise;


void setup() {
  size(300,300);
  background(255);
  smooth();
  xstart=random(10);
  xNoise=xstart;
  yNoise=random(10);
  for (int y=0; y<=height; y+=5) {
    yNoise+=.1;
    xNoise=xstart;
    for (int x=0; x<=width; x+=5) {
      xNoise+=.1;
      drawPoint(x,y,noise(xNoise,yNoise));
    }
  }
}
      

void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x,y);
  rotate(noiseFactor*radians(360));
  stroke(0,150);
  line(0,0,20,0);
  popMatrix();
}

