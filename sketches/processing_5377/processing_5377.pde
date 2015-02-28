


Wave waveA;
Wave waveB;

float wWidth = 10;
float wHeight = 10;
float wOffset = 0;
int wForm = 1;


void setup() {
  
  size(480, 320);
  smooth();
  
  waveA = new Wave(wWidth, wHeight, wOffset, wForm);
  waveB = new Wave(wWidth, wHeight, wOffset, wForm);
}



void draw() {
  
  background(100);
  
  wWidth = map(mouseX, 0, width, 10, 100);
  wHeight = map(mouseY, 0, height, -100, -10);
  
  stroke(150);
  waveA.drawWave(wWidth, wHeight, wOffset, 2);      // Draws Sine
  stroke(255);
  waveB.drawWave(wWidth, wHeight, wOffset, wForm);
}



class Wave {
  
  float waveWidth;
  float waveHeight;
  float waveOffset;
  int waveForm;
  
  Wave(float waveWidth_, float waveHeight_, float waveOffset_, int waveForm_) {
    waveWidth = waveWidth_;
    waveHeight = waveHeight_;
    waveOffset = waveOffset_;
    waveForm = waveForm_;
  }

  void drawWave(float waveWidth, float waveHeight, float waveOffset, int waveForm) {
    
    pushMatrix();
    translate(0, height/2 + waveOffset);
    
    switch(waveForm) {
      case 1:
        drawPulse(waveWidth, waveHeight);
        break;
      case 2:
        drawSine(waveWidth, waveHeight);
        break;
      case 3:
        drawTri(waveWidth, waveHeight);
        break;
      case 4:
        drawRamp(waveWidth, waveHeight);
        break;
      case 5:
        drawSaw(waveWidth, waveHeight);
        break;
    }
    popMatrix();
  }
}



void drawPulse(float waveWidth, float waveHeight) {
  
  noFill();
  
  for(int i = 0; i < width; i += waveWidth) {
    beginShape();
    vertex(i, 0);
    vertex(i, waveHeight);
    vertex(i + waveWidth/2, waveHeight);
    vertex(i + waveWidth/2, 0);
    vertex(i + waveWidth, 0);
    endShape();
  }
}



void drawRamp(float waveWidth, float waveHeight) {
  
  noFill();
  
  for(int i = 0; i < width; i += waveWidth) {
    beginShape();
    vertex(i, waveHeight);
    vertex(i + waveWidth, 0);
    vertex(i + waveWidth, waveHeight);
    endShape();
  }
}



void drawSaw(float waveWidth, float waveHeight) {
  
  noFill();
  
  for(int i = 0; i < width; i += waveWidth) {
    beginShape();
    vertex(i, 0);
    vertex(i + waveWidth, waveHeight);
    vertex(i + waveWidth, 0);
    endShape();
  }
}



void drawSine(float waveWidth, float waveHeight) {
  
  noFill();
  
  for(int i = 0; i < width; i += waveWidth) {
    beginShape();
    vertex(i, 0);                                     // 1st vertex
    bezierVertex(i + waveWidth/4, 0,                  // cx1, cy1
                 i + waveWidth/4, waveHeight,         // cx2, cy2
                 i + waveWidth/2, waveHeight);        // 2nd vertex
    bezierVertex(i + (3 * waveWidth/4), waveHeight,   // cx1, cy1
                 i + (3 * waveWidth/4), 0,            // cx2, cy2
                 i + waveWidth, 0);                   // 3rd vertex
    endShape();
  }
}



void drawTri(float waveWidth, float waveHeight) {
  
  noFill();
  
  for(int i = 0; i < width; i += waveWidth) {
    beginShape();
    vertex(i, 0);
    vertex(i + waveWidth/2, waveHeight);
    vertex(i + waveWidth, 0);
    endShape();
  }
}



void keyPressed() {
  
  if(key == CODED) {
    if(keyCode == UP) {
      if(wForm < 5) {            // hardwired number of waveforms
        wForm += 1;              // increment
      } else {
        wForm = 1;               // reset waveform to 1st waveform
      }
    } else if(keyCode == DOWN) {
      if(wForm > 1) {
        wForm -= 1;              // decrement
      } else {
        wForm = 5;               // reset waveform to 5th waveform
      }
    }
  }
}


