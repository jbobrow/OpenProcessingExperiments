
PImage img;
import processing.video.*;
Capture myCapture;



void setup() {
  size(640, 480);
  smooth();

  img = loadImage("bild.jpg");
  myCapture = new Capture(this, width, height, 30);
}

int circleSize = 8;

void draw() {
  randomSeed(0);
  translate(circleSize/2,circleSize/2);
  background(0,0,0);
noStroke();
  for (int i = 0; i<width/circleSize;i++) {
    for (int j = 0; j<height/circleSize;j++) {

    
      float circleSize2 = 255-saturation(myCapture.get(i*circleSize, j*circleSize));
      float r = brightness(myCapture.get(i*circleSize, j*circleSize))/25;
      
      fill(myCapture.get(i*circleSize, j*circleSize) );
     // fill(0);
      
      pushMatrix();
     translate(i*circleSize, j*circleSize);
     rotate (r/3);
      rect(r,r, circleSize2/30, circleSize2/6);
      popMatrix();  
  }
  }

 // image(myCapture,0,0);
}


void captureEvent(Capture myCapture) {
  myCapture.read();
}


