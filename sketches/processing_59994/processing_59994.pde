
import krister.Ess.*;

FFT myfft;
AudioInput myinput;
int bufferSize=512;

void setup() {
  size(532,400);
  frameRate(30);
  background(255);
  noStroke();
  fill(0);

  Ess.start(this);
  myinput=new AudioInput(bufferSize);
  myfft=new FFT(bufferSize*2);
  myinput.start();

  myfft.damp(.3);
  myfft.equalizer(true);
  myfft.limits(.005,.05);
}

void draw() {
  background(255);
  for (int i=0; i<bufferSize;i++) {
    rect(i+10,390,1,myfft.spectrum[i]*-400);
  }
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}



