
import codeanticode.gsvideo.*;

int numPixels;
int[] previousFrame;
GSCapture video;

import krister.Ess.*;

FFT fft;
AudioInput input;
int bufferSize=256;

void setup() {
  size(640, 480); 
  video = new GSCapture(this, width, height, 24);
  numPixels = video.width * video.height;
 
  previousFrame = new int[numPixels];
  loadPixels();
  Ess.start(this);
  input=new AudioInput(bufferSize);
  fft=new FFT(bufferSize*2);
  input.start();

  fft.damp(.3);
  fft.equalizer(true);
  fft.limits(.005,.01);
}

void draw() {
  if (video.available()) {
    video.read(); 
    video.loadPixels();
    
    int movementSum = 0; 
    for (int i = 0; i < numPixels; i++) { 
      color currColor = video.pixels[i];
      color prevColor = previousFrame[i];
      
      int currR = (currColor >> 16) & 0xFF; 
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
     
      int prevR = (prevColor >> 16) & 0xFF;
      int prevG = (prevColor >> 8) & 0xFF;
      int prevB = prevColor & 0xFF;
      
      int diffR = abs(currR - prevR);
      int diffG = abs(currG - prevG);
      int diffB = abs(currB - prevB);
      
      movementSum += diffR + diffG + diffB;
      
      pixels[i] = 0xff000000 | (diffR << 16) | (diffG << 8) | diffB;
      previousFrame[i] = currColor;
    }
      if (movementSum > 0) {
      updatePixels();
      println(movementSum);
    }
    
  pushStyle();
  noStroke();
  fill(255,50);
  rect(0,0,width,height);
  popStyle();

  renderSpectrum(50, height/2, 5, 400);
  }
}

public void audioInputData(AudioInput input) {
  fft.getSpectrum(input);
}

void renderSpectrum(int X, int Y, int S, int A) {
  pushStyle();
  noStroke();
  for (int i=1; i<(width-2*X)/S; i++) {
    float v=fft.spectrum[i];
    fill((v-fft.spectrum[i-1])*200,v*200,(v-fft.spectrum[i+1])*600,30);
    rect((i*S)+X,Y+v*(A/2),3,v*-A);
  }
  popStyle();

  pushStyle();
  stroke(255,200);
  strokeWeight(2);
  noFill();
  int interp=max(0,(((millis()-input.bufferStartTime)/input.duration)*input.size));
  beginShape();
  for (int i=0;i<(width-2*X)/S;i++) {
    float pos=Y;
    if (i+interp+1<input.buffer2.length) {
      pos-=input.buffer2[i+interp]*A*2;
    }
    curveVertex(X+i*S,pos);
  }
  endShape();
  popStyle();
}

void keyPressed() {
  if (key=='s') {
    saveFrame("waveform-####.png");
  }
}

