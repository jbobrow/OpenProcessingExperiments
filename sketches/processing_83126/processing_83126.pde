

float[] x = new float[10];
float[] y = new float[10];
float segLength = 40;





PImage img; 
void setup() {
  size(800, 750);
  
  smooth(); 
  fill(#C6C6C6);
  ellipse(0,0,10,10);
  
  
   ellipseMode(RADIUS); 
  frameRate(30);
  
  img = loadImage("shuttlecock.jpg");  
}





void draw() {
  background(#FFFFFF);

  image(img, 150, 160);
  


dragSegment(0, mouseX, mouseY);
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
 
  
  ellipse(0, 0, segLength, 0);
  
  popMatrix();
  
}



