
import controlP5.*;

boolean started;
int iCount, ringCount;
float x, s, iStep, amp, maxAmp;

void setup() {
  frameRate(25);
  size(750, 750);
  background(#444444);
  text("Gawden | Christian Geick, © 2014", width-175, height-25);
  
  started = false;
  ringCount = 6;
  iCount = 180;
  amp = 0;
  maxAmp = 500;
}

void draw() {
  if(started) {
    background(#333333);
    noStroke();
    fill(#333333,10);
    rect(0,0,width, height);
    translate(width/2, height/2);
    
    amp+=0.01;
    rotate(radians(amp));
    
    for(int ring=0; ring<ringCount; ring++) {
      float i = 0;
      while(i<360) {
        if(i>0) {
          pushMatrix();
            rotate(radians(i));
            noStroke();
            fill(#DDDDDD);
  
            if(ring%2 == 0) {
              s = sin(amp+ring+i+HALF_PI)*(10/(ring+1))+(20/(ring+1));
              x = sin(amp+ring+i)*maxAmp/pow(2,ring+1)+maxAmp*(2/pow(2,ring));
            } else {
              s = cos(amp+ring+i+HALF_PI)*(10/(ring+1))+(20/(ring+1));
              x = cos(amp+ring+i)*maxAmp/pow(2,ring+1)+maxAmp*(2/pow(2,ring));
            }
  
            ellipse(x, 0, s, s);
          popMatrix();
        }
        i += iStep;
      }
    }
    
  }
}

void mouseClicked() {
  started = true;
  reset();
}

boolean sketchFullScreen() {
  return false;
}

public void reset() {
  iStep = 360/iCount;
}
