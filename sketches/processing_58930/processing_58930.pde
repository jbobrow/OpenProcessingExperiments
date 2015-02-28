
import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;

PImage bg;
int a; 

void setup() {
  size(1580,400);
  frameRate(3000);
  background(22, 76, 84);
  noStroke();
  fill(0);
 
  
  bg = loadImage("sky.png");

  Ess.start(this);
  myinput=new AudioInput(bufferSize);
  myfft=new FFT(bufferSize*2);
  myinput.start();

  myfft.damp(.3);
  myfft.equalizer(true);
  myfft.limits(7,7);
}

void draw() {
  background(32, 129, 211, 75);
  

  
  
  for (int i=0; i<bufferSize;i++) {
    ellipse(i+10,400,2000,myfft.spectrum[i]*-700);
  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}

