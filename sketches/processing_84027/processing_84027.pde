
PImage img;
import processing.video.*;
Capture myCapture;
 
 
 
void setup() {
  size(900,680);
  smooth();
 
 
  myCapture = new Capture(this, width, height, 50);
}
 
int circleSize = 7;
 
void draw() {
  randomSeed(0);
  translate(circleSize/2,circleSize/2);
  background(0);
strokeWeight(3/10);
strokeCap(ROUND);
stroke(255,0,0);
  for (int i = 0; i<width/circleSize;i++) {
    for (int j = 0; j<height/circleSize;j++) {
 
     
      float circleSize2 = 30-brightness(myCapture.get(i*circleSize, j*circleSize));
      float r =30* brightness(myCapture.get(i*circleSize, j*circleSize))/40;
      fill(myCapture.get(i*circleSize, j*circleSize) );
   
       
      pushMatrix();
     translate(i*circleSize, j*circleSize);
     rotate(mouseX/r);
     ellipse(0,0, circleSize2/r*2, circleSize2/5);
     fill(0,0,0);
      popMatrix(); 
  }
  }
 
 
}
 
 
void captureEvent(Capture myCapture) {
  myCapture.read();
}


