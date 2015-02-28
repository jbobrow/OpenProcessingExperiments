

float[] x = new float[20];
float[] y = new float[20];
float segLength = 10;

PImage img;                            // apple
 
void setup() {
  size(210, 240);                      // window size
  strokeWeight(9);                     // thickness
  stroke(0, 200, 0 );                  // green worm
  img = loadImage("apple.jpeg");       // background image
  image(img, 0, 0);
}

void draw() {
 
  dragSegment(0, mouseX, mouseY);     // draw worm
  
}


void dragSegment(int i, float xin, float yin) {   // worm movement
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




