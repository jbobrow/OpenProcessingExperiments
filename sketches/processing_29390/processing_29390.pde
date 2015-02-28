
PImage img;
import processing.video.*;
Capture myCapture;

void setup() {
  size(640, 853);
  smooth();

  img = loadImage("bild2.jpg");
 myCapture = new Capture(this, width, height, 30);
}

int circleSize = 6;

void draw() {
  randomSeed(0);
  translate(circleSize/2, circleSize/2);
  background(0);
  noStroke();
  for (int i = 0; i<width/circleSize;i++) {
    for (int j = 0; j<height/circleSize;j++) {


      float circleSize2 =  red(myCapture.get(i*circleSize/4, j*circleSize));
      float circleSize3 =  green(myCapture.get(i*circleSize, j*circleSize/2));
      float circleSize4 =  blue(myCapture.get(i*circleSize, j*circleSize));

      float r = red(myCapture.get(i*circleSize, j*circleSize))/10;

      fill(myCapture.get(i*circleSize, j*circleSize) );
      // fill(0);
      fill(255, 0, 0 ); 
      pushMatrix();
      translate(i*circleSize, j*circleSize);

      rect(0, 0, circleSize2/25, circleSize2/25);
      fill(0, 255, 0 );    
      ellipse(0, 5, circleSize3/25, circleSize3/25);
      fill(0, 0, 255 );
      rect(5, 0, circleSize4/2, circleSize4/25);

      popMatrix();
    }
  }

  // image(myCapture,0,0);
}



void captureEvent(Capture myCapture) {
  myCapture.read();
}

