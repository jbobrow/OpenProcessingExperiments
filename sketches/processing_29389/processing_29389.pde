
PImage img;
import processing.video.*;
Capture myCapture;


void setup() {
  size(640, 480);
  smooth();

  img = loadImage("bild2.jpg");
  myCapture = new Capture(this, width, height, 30);
}

int circleSize = 2;

void draw() {
  randomSeed(0);
  translate(circleSize/2,circleSize/2);
  background(255);

  for (int i = 0; i<width/circleSize;i++) {
    for (int j = 0; j<height/circleSize;j++) {

    
      float circleSize2 = 0-brightness(myCapture.get(i*circleSize, j*circleSize));
      float r = brightness(myCapture.get(i*circleSize, j*circleSize))/100;
      
      fill(myCapture.get(i*circleSize, j*circleSize) );
     // fill(0);
      
      pushMatrix();
     translate(i*circleSize, j*circleSize);
     
      rect(0,5, r, r);
      popMatrix();  
  }
  }


 // image(myCapture,0,0);
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}



