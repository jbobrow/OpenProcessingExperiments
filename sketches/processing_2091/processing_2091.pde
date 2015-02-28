
/* 
 * Color Tiles by Algirdas Rascius (http://mydigiverse.com).
 */
/** 
 * Mouse-click to reset.
 */ 
 
ArrayList flowers; 

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  colorMode(HSB, 1, 1, 1, 1);
  noiseDetail(2);
  initialize();
}

final static int STEP = 50;
final static float BEZIER_BASE = 25;
final static int OFFSET = 3;

float time = 0;
float hueOffset = 0;

void draw() {
  background(0, 0, 1);
  
  for (int x=STEP*3/2; x<width; x+=STEP) {
    for (int y=STEP*3/2; y<width; y+=STEP) {
      fill(getColor(x, y));
      beginShape();
      int x0 = x-STEP+OFFSET;
      int y0 = y-STEP+OFFSET;
      int x1 = x - OFFSET;
      int y1 = y - OFFSET;
      vertex(x0, y0);
      addBezierVertex(x0, y0, x1, y0);
      addBezierVertex(x1, y0, x1, y1);
      addBezierVertex(x1, y1, x0, y1);
      addBezierVertex(x0, y1, x0, y0);
      endShape();
    }
  }
  time += 0.005;
  hueOffset += noise(time)*0.001;
}

color getColor(int x, int y) {
  return color((noise(time, x*0.1/STEP, y*0.1/STEP)*0.5+hueOffset)%1, noise(time, x*0.1/STEP+1000, y*0.1/STEP+1000)*0.5+0.5, 1);
}

float getRotation(int x, int y) {
  return (noise(time, x*0.1/STEP-1000, y*0.1/STEP-1000)-0.5)*PI;
}

void addBezierVertex(int x0, int y0, int x1, int y1) {
  float a = atan2(y1-y0, x1-x0);
  float a0 = a + getRotation(x0, y0);
  float a1 = a + getRotation(x1, y1);
    
  bezierVertex(x0+BEZIER_BASE*cos(a0), y0+BEZIER_BASE*sin(a0), x1-BEZIER_BASE*cos(a1), y1-BEZIER_BASE*sin(a1), x1, y1);
}

void mousePressed() {
  initialize();
}

void keyPressed() {
  initialize();
}

void initialize() {
  noiseSeed((int)random(10000));
  hueOffset = random(1);
}


