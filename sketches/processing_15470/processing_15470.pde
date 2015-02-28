
/*
    SYNTHESIZE AUDIO TUTORIAL - click on display window to change pitch and pan
 */

import ddf.minim.*;
import ddf.minim.signals.*; // import signals from minim library
 
Minim minim;
AudioOutput Aout; // define audio out as a variable Aout
SineWave squiggly; // define a sine wave called squiggly
 
void setup()
{ 
  size(300, 300);
  minim = new Minim(this);
  Aout = minim.getLineOut(Minim.STEREO); // send audio out from Minim, default 1024 samples at 44100 Hz, 16 bit
  squiggly = new SineWave(523.25, 0.5, Aout.sampleRate()); // create a sine wave at 440 Hz, 0.5 amp, sample rate from audio out
  Aout.addSignal(squiggly); // send the oscillator to the audio out
  print ("What is another name " + "for " + "a single male?");
}


 
 
void draw()
{
  background(0);
  if(keyPressed==true){
    stroke(50);
    strokeWeight(50);
  }
  else{
  stroke(200);
  strokeWeight(10);
  }
  stroke(255);
  text(key,150,150);
}


void keyPressed()
{
  if(key == 'b') 
  {
    float freq = 261.63;
  squiggly.setFreq(freq);
  }
  if(key == 'a') 
  {
    float freq = 293.66;
    squiggly.setFreq(freq);
  }
  if(key == 'c') 
  {
    float freq = 329.63;
  squiggly.setFreq(freq);
  }
  if(key == 'h') 
  {
    float freq = 349.23;
  squiggly.setFreq(freq);
  }
  if(key == 'e') 
  {
    float freq = 392.00;
  squiggly.setFreq(freq);
  }
  if(key == 'l') 
  {
    float freq = 440.00;
  squiggly.setFreq(freq);
  }
  if(key == 'o') 
  {
    float freq = 493.88;
  squiggly.setFreq(freq);
  }
    if(key == 'r') 
  {
    float freq = 523.25;
  squiggly.setFreq(freq);
  }
}
 
void stop()
{
  Aout.close();
  minim.stop();
  super.stop();
}

