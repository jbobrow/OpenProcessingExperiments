
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer sound;

BandPass bpf;
FFT fft;
float centerFreq;
float bandwidth;

float gain = 60; // in dB

int spectrumScale = 2; // pixels per FFT bin

void setup()
{
  size(500, 400);
  textFont(createFont("SanSerif", 12));
  
  minim = new Minim(this);
  minim.debugOn();
  
  sound = minim.loadFile("Winter.mp3");
  // make it repeat
  sound.loop();

 
  centerFreq = 440;
  bandwidth = 20;
  bpf = new BandPass(centerFreq, bandwidth, sound.sampleRate());
  sound.addEffect(bpf);

  fft = new FFT(sound.bufferSize(), sound.sampleRate());

  fft.window(FFT.HAMMING);

}



void draw()
{
  background(0);
  fft.forward(sound.mix);
 
  noStroke();
  noFill();
  float y;
  y=random(140);
  stroke(y);
  ellipse(210,140,260,275); 
  int i=0;
  
    float val = 2*(20*((float)Math.log10(fft.getBand(i))) + gain);
    stroke(#00FF00);
    bezier(165-Math.round(val),170-i*spectrumScale,230,150,100,random(150)-spectrumScale,290,130-Math.round(val));
    stroke(#FF00FF);
    bezier(170-Math.round(val),220-i*spectrumScale,230,190,100,random(200)-spectrumScale,270,130-Math.round(val));
 
}

void keyReleased()
{
  // +/- used to adjust gain on the fly
  if (key == '+' || key == '=') {
    gain = gain + 3.0;
  } else if (key == '-' || key == '_') {
    gain = gain - 3.0;
  }
}

void stop()
{
  
  sound.close();
  minim.stop();
  super.stop();
}

