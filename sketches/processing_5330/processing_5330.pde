

int displayedWave = 1;


void setup() {
  size(480, 320);
  smooth();
}



void draw() {
  translate(0, height/2);
  background(100);

  float wWidth = map(mouseX, 0, width, 10, 100);
  float wHeight = map(mouseY, 0, height, -100, -10);

  if(displayedWave == 1) {
    drawPulse(wWidth, wHeight);
  } else if(displayedWave == 2) {
    drawRamp(wWidth, wHeight);
  } else if(displayedWave == 3) {
    drawSaw(wWidth, wHeight);
  } else if(displayedWave == 4) {
    drawSine(wWidth, wHeight);
  } else if(displayedWave == 5) {
    drawTri(wWidth, wHeight);
  }
}



void drawPulse(float waveWidth, float waveHeight) {
  stroke(255, 255, 255);
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
  stroke(255, 255, 255);
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
  stroke(255, 255, 255);
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
  stroke(255, 255, 255);
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
  stroke(255, 255, 255);
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
      if(displayedWave < 5) {            // hardwired number of waveforms
        displayedWave += 1;              // increment
      } else {
        displayedWave = 1;               // reset waveform to 1st waveform
      }
    } else if (keyCode == DOWN) {
      if(displayedWave > 1) {
        displayedWave -= 1;              // decrement
      } else {
        displayedWave = 5;               // reset waveform to 5th waveform
      }
    }
  }
}

