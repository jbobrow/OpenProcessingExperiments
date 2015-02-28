

import ddf.minim.*;

import ddf.minim.analysis.*;
Minim minim;
AudioInput in;
FFT fft;
float volume = 0;
float magNum = 5;


void setup () {
  size(500, 500);
  background(0);
  initMinim();
  

  smooth();
}

void draw() {
  runMinim();
  
  bluringWhiten(1);
  fill(random(255), random(255), random(255), random(100)+random(100));
  noStroke();
  ellipse(mouseX, mouseY, volume*magNum, volume*magNum);
}

void keyPressed() {
  if (key=='x' || key=='X') {
    if (magNum<10) { magNum += 0.1; }
  } else if (key=='z' || key=='Z') {
    if (magNum>0.2) { magNum -= 0.1; }
  }
  
}

void stop() {
 
  in.close();

  minim.stop();
  super.stop();
}
void initMinim() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate()); 
}

void runMinim() {
  fft.forward(in.mix);
  volume = (fft.getBand(0) + fft.getBand(1) 
               + fft.getBand(2) + fft.getBand(3) + fft.getBand(5));
   
}

void bluringDarken(int value) {
  int pixelTmpR, pixelTmpG, pixelTmpB;
  int upNum, downNum, i;
  loadPixels();
  for (int y=0; y<height; y++) {
    for (int x=1; x<width-1; x++) {
      i = x + y*width;
      pixelTmpB = (((pixels[i-1])&0x000000ff)) + (((pixels[i])&0x000000ff) << 1) + (((pixels[i+1])&0x000000ff));
      pixelTmpG = ((((pixels[i-1]&0x0000ff00)>>8)&0xFF)) + ((((pixels[i]&0x0000ff00)>>8)&0xFF) << 1) + ((((pixels[i+1]&0x0000ff00)>>8)&0xFF));
      pixelTmpR = ((((pixels[i-1]&0x00ff0000)>>16)&0xFF)) + ((((pixels[i]&0x00ff0000)>>16)&0xFF) << 1) + ((((pixels[i+1]&0x00ff0000)>>16)&0xFF));
      pixelTmpR >>= 2;
      pixelTmpG >>= 2;
      pixelTmpB >>= 2;
      pixelTmpR = max(0, pixelTmpR-value);
      pixelTmpG = max(0, pixelTmpG-value);
      pixelTmpB = max(0, pixelTmpB-value);
      pixels[i] = (((0xff)<<24) | ((0xff & pixelTmpR)<<16) | ((0xff & pixelTmpG)<<8) | (0xff & pixelTmpB));
    }
  }
  for (int x=0; x<width; x++) {
    for (int y=1; y<height-1; y++) {
      i = x + y*width;
      upNum = i - width;
      downNum = i + width;
      pixelTmpB = (((pixels[upNum])&0x000000ff)) + (((pixels[i])&0x000000ff) << 1) + (((pixels[downNum])&0x000000ff));
      pixelTmpG = ((((pixels[upNum]&0x0000ff00)>>8)&0xFF)) + ((((pixels[i]&0x0000ff00)>>8)&0xFF) << 1) + ((((pixels[downNum]&0x0000ff00)>>8)&0xFF));
      pixelTmpR = ((((pixels[upNum]&0x00ff0000)>>16)&0xFF)) + ((((pixels[i]&0x00ff0000)>>16)&0xFF) << 1) + ((((pixels[downNum]&0x00ff0000)>>16)&0xFF));
      pixelTmpR >>= 2;
      pixelTmpG >>= 2;
      pixelTmpB >>= 2;
      pixelTmpR = max(0, pixelTmpR-value);
      pixelTmpG = max(0, pixelTmpG-value);
      pixelTmpB = max(0, pixelTmpB-value);
      pixels[i] = (((0xff)<<24) | ((0xff & pixelTmpR)<<16) | ((0xff & pixelTmpG)<<8) | (0xff & pixelTmpB));
    }
  }
  updatePixels();
}

void bluringWhiten(int value) {
  int pixelTmpR, pixelTmpG, pixelTmpB;
  int upNum, downNum, i;
  loadPixels();
  for (int y=0; y<height; y++) {
    for (int x=1; x<width-1; x++) {
      i = x + y*width;
      pixelTmpB = (((pixels[i-1])&0x000000ff)) + (((pixels[i])&0x000000ff) << 1) + (((pixels[i+1])&0x000000ff));
      pixelTmpG = ((((pixels[i-1]&0x0000ff00)>>8)&0xFF)) + ((((pixels[i]&0x0000ff00)>>8)&0xFF) << 1) + ((((pixels[i+1]&0x0000ff00)>>8)&0xFF));
      pixelTmpR = ((((pixels[i-1]&0x00ff0000)>>16)&0xFF)) + ((((pixels[i]&0x00ff0000)>>16)&0xFF) << 1) + ((((pixels[i+1]&0x00ff0000)>>16)&0xFF));
      pixelTmpR >>= 2;
      pixelTmpG >>= 2;
      pixelTmpB >>= 2;
      pixelTmpR = min(0xff, pixelTmpR+value);
      pixelTmpG = min(0xff, pixelTmpG+value);
      pixelTmpB = min(0xff, pixelTmpB+value);
      pixels[i] = (((0xff)<<24) | ((0xff & pixelTmpR)<<16) | ((0xff & pixelTmpG)<<8) | (0xff & pixelTmpB));
    }
  }
  for (int x=0; x<width; x++) {
    for (int y=1; y<height-1; y++) {
      i = x + y*width;
      upNum = i - width;
      downNum = i + width;
      pixelTmpB = (((pixels[upNum])&0x000000ff)) + (((pixels[i])&0x000000ff) << 1) + (((pixels[downNum])&0x000000ff));
      pixelTmpG = ((((pixels[upNum]&0x0000ff00)>>8)&0xFF)) + ((((pixels[i]&0x0000ff00)>>8)&0xFF) << 1) + ((((pixels[downNum]&0x0000ff00)>>8)&0xFF));
      pixelTmpR = ((((pixels[upNum]&0x00ff0000)>>16)&0xFF)) + ((((pixels[i]&0x00ff0000)>>16)&0xFF) << 1) + ((((pixels[downNum]&0x00ff0000)>>16)&0xFF));
      pixelTmpR >>= 2;
      pixelTmpG >>= 2;
      pixelTmpB >>= 2;
      pixelTmpR = min(0xff, pixelTmpR+value);
      pixelTmpG = min(0xff, pixelTmpG+value);
      pixelTmpB = min(0xff, pixelTmpB+value);
      pixels[i] = (((0xff)<<24) | ((0xff & pixelTmpR)<<16) | ((0xff & pixelTmpG)<<8) | (0xff & pixelTmpB));
    }
  }
  updatePixels();
}




