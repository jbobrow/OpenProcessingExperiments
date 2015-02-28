
PImage img;
import processing.video.*;
Capture myCapture;



void setup() {
  size(640, 480);
  smooth();

  
  myCapture = new Capture(this, width, height, 30);
}

int circleSize = 10;

void draw() {

  randomSeed(4);
  translate(circleSize/2, circleSize/2);
  background(0);
  noStroke();
  for (int i = 0; i<width/circleSize;i++) {
    for (int j = 0; j<height/circleSize;j++) {


      float circleSize2 =  brightness(myCapture.get(i*circleSize, j*circleSize));
      float circleSize3 =  brightness(myCapture.get(i*circleSize, j*circleSize));
      float circleSize4 =  brightness(myCapture.get(i*circleSize, j*circleSize));

      float r = saturation(myCapture.get(i*circleSize, j*circleSize))/40;

      fill(myCapture.get(i*circleSize, j*circleSize) );
      
      fill(0 ); 
      pushMatrix();
      
       noFill( ); 
   stroke(5);
      translate(i*circleSize, j*circleSize);
    

      ellipse(0, 0, circleSize2/50, circleSize2/50);
    
    fill(random(200));
    ellipse(0, 0, circleSize3/100, circleSize3/100);
       
   fill(random(255));
      ellipse(0,0, circleSize4/100, circleSize4/100);
      

      popMatrix();
    }
  }

  
}


void captureEvent(Capture myCapture) {
  myCapture.read();
}

                
