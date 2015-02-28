
PImage img;
import processing.video.*;
Capture myCapture;



void setup() {
  size(640, 480);
  smooth();

  img = loadImage("bild.jpg");
  myCapture = new Capture(this, width, height, 30);
}

int circleSize = 9;

void draw() {
  randomSeed(0);
  translate(circleSize/2,circleSize/2);
  background(0);
strokeWeight(1/10);
  for (int i = 0; i<width/circleSize;i++) {
    for (int j = 0; j<height/circleSize;j++) {

    
      float circleSize2 = 20-brightness(myCapture.get(i*circleSize, j*circleSize));
      //float circleSize3 = 120-brightness(myCapture.get(i*circleSize, j*circleSize));
      float r =20* brightness(myCapture.get(i*circleSize, j*circleSize))/40;
      
      fill(myCapture.get(i*circleSize/20, j*circleSize) );
     // fill(0);
      
      pushMatrix();
     translate(i*circleSize, j*circleSize);
     
   
    rotate(mouseX/r);
      rect(0,0, circleSize2/r*2, circleSize2/5);
    //  fill(myCapture.get(i*circleSize/20, j*circleSize) );
      fill(random(255));
      popMatrix();  
  }
  }

 // image(myCapture,0,0);
}


void captureEvent(Capture myCapture) {
  myCapture.read();
}


