
import krister.Ess.*;
import processing.opengl.*;

float a;
FFT myfft;
AudioInput myinput;
int bufferSize=512;

void setup() {
size(800,600, OPENGL);
frameRate(24);
background(255);
smooth();
fill(0);
strokeWeight(5);


Ess.start(this);
myinput=new AudioInput(bufferSize);
myfft=new FFT(bufferSize*2);
myinput.start();

myfft.damp(.3);
myfft.equalizer(true);
myfft.limits(.025,.20);
}

void draw() {
background(255);








for (int i=0; i<bufferSize;i++) {
line(i,400,0,myfft.spectrum[i]);
rotate(myfft.spectrum[i]);
translate(myfft.spectrum[i], i, myfft.spectrum[i]);

}
}

public void audioInputData(AudioInput theInput) {
myfft.getSpectrum(myinput);
}

