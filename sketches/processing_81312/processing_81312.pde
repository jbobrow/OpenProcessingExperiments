
//* To view the original sketch visit: http://www.openprocessing.org/sketch/63593

PImage img; 

float[] x = new float[100];
float[] y = new float[100];
float segLength =2;
  
void setup() {
  size(775, 500);
  img = loadImage ("log.jpg");
  smooth();
  strokeWeight(6);
  stroke(0, 85);
}
 
void draw() {
  noCursor();
  background(255);
  image (img, 0, 0);
  dragSegment(0, mouseX, mouseY);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
 
    stroke(255);
   strokeWeight(0.5);
    fill(153, 0, 0);
    ellipse(mouseX, mouseY, 20,20);
     noStroke();
        fill(255, 102, 51);
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
  stroke(204, 102, 0);
 strokeWeight(0.45);
  line(0, 0, segLength-45, -30);
  line(0, 0, segLength-45, 30);
   
  fill(204, 204, 0);
  ellipse(0, 0, 40, 10);
 
  popMatrix();
}


