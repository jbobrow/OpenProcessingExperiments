
// Move the mouse and observe how it affects the motion of the circle.
// The patterns represent where the circle will spend most time.

// mouseX defines how much time is spent at the beginning of the animation,
// mouseY defines how much time is spent at the end of the animation.

// t increases linearly, but bezierPoint() is used to create acceleration
// and decceleration.
 
int hparts = 7;
int vparts = 7;
 
float w;
float h;
 
void setup() {
  size(600, 600);
  background(255);
  smooth();
 
  w = width / float(hparts);
  h = height / float(vparts);
  
  for(float x=0; x<hparts; x++) {
    for(float y=0; y<vparts; y++) {        
      for(float z=0; z<=1; z+=0.03) {
        float xx = 5 + x*w + (w-10)*bezierPoint(0, x/(hparts-1), y/(vparts-1), 1, z);
        stroke(0, 100);
        line(xx, y*h+5, xx, y*h+h-10);
      }
    }
  }
  noStroke();
}
void draw() {
  float loopLength = 100.0;
  float t = frameCount % loopLength /loopLength;
  
  fill(255);
  rect(0, h*4 - 9, width, 12);
  
  float c0 = mouseX/float(width);
  float c1 = mouseY/float(height);
  float xx = width * bezierPoint(0, c0, c1, 1, t);
 
  fill(120);
  text("bezierPoint(0, " + nf(c0, 1, 2) + ", " + nf(c1, 1, 2) + ", 1, " + t + ")", 20, h*4+1);
 
  fill(255, 0, 0);
  ellipse(xx, h*4-3, 7, 7);
}
