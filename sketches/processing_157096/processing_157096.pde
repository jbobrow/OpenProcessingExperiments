
float[] x = new float[20];
float[] y = new float[20];
float segLength = 18;
float myx= 320;
float myy= 180;

void setup() {
  size(640, 360);
  strokeWeight(9);
  stroke(255, 100);
}

void draw() {
  if(mousePressed){
  stroke(random(255), random(255), random(255),(255));
  }
  background(0);
  myx=myx+random(80)-40;
 myy=myy+random(80)-40;
if( myx<0)myx=myx+10;
if(myy<0)myy=myy+10;
if(myx>640)myx=myx-10;
if(myy>360)myy=myy-10;
  dragSegment(0, myx, myy);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
