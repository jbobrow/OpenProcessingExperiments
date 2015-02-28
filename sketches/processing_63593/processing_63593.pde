


float[] x = new float[100];
float[] y = new float[100];
float segLength =2;
 
void setup() {
  size(400, 400);
  smooth(); 
  strokeWeight(6);
  stroke(0, 85);
}

void draw() {
  noCursor();
  background(255);
  dragSegment(0, mouseX, mouseY);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);

    stroke(0);
   strokeWeight(0.5);
    fill(255);
    ellipse(mouseX, mouseY, 20,20);
     noStroke();
        fill(0);
    ellipse(mouseX, mouseY, 12,12);
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
  stroke(0);
 strokeWeight(0.25);
  line(0, 0, segLength-30, -20);
  line(0, 0, segLength-30, 20);
  
  fill(255);
  ellipse(0, 0,10, 10);

  popMatrix();
}



