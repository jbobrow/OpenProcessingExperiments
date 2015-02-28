

float[] x = new float[20];
float[] y = new float[20];
float segLength = 40;

void setup() {
  size(1080, 720);
  strokeWeight(5);
  stroke(250, 250);
}

void draw() {
  background(0);
  dragSegment(0,mouseX,mouseY);
  for(int i=0; i<x.length-10; i++) {
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


