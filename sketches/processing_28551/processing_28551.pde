
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
FFT fft;
AudioInput in;
int bufferSize = 512;
int fftSize = floor(bufferSize*.5f)+1;
//draw
float ai = TWO_PI/fftSize;

void setup(){
  size(400,400,P2D);
  smooth();
  noStroke();
  colorMode(HSB,fftSize,100,100);
  initSound();
}

void draw(){
  background(0,0,100);
  fft.forward(in.right);
  for(int i = 0; i < fftSize; i++){
    float band = fft.getBand(i);
    fill(i,150+100*(band/10),100,100);
    arc(200,200,200+band * (i+1),200+band * (i+1),ai*i,ai*(i+1));
  }
}
void initSound(){
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
}
void stop()
{
  in.close();
  minim.stop();
  super.stop();
}

