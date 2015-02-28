
float xstart,ystart,xNoise,yNoise,xsNoise,ysNoise;
int w=300;
int h=300;

void setup() {
  size(300,300);
  background(0);
  smooth();
  frameRate(24);
  xstart=random(10);
  ystart=random(10);
  xsNoise=random(10);
  ysNoise=random(10);
}
      
void draw() {
  background(0);
  xsNoise+=.01;
  ysNoise+=.01;
  xstart+=(noise(xsNoise)*0.5)-0.25;
  ystart+=(noise(ysNoise)*0.5)-0.25;
  xNoise=xstart;
  yNoise=ystart;
  
  
  for (int y=0; y <= height; y+=5) {
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
  rotate(noiseFactor*radians(540));
  noStroke();
  float edgeSize=noiseFactor*35;
  float grey=150+(noiseFactor*120);
  float alpha = 150+(noiseFactor*120);
  fill(grey,alpha);
  ellipse(0,0,edgeSize,edgeSize/2);

//  rotate(noiseFactor*radians(360));
//  stroke(0,150);
//  line(0,0,20,0);
    popMatrix();
}

