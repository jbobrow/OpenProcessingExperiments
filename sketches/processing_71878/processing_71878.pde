
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
Minim minim2;
AudioInput in;
AudioOutput out;
float prevEllipseHeight;
float ellipseHeight;
SineWave sine;


void setup () {
  
  size(500, 500);
  textMode(SCREEN); 

  prevEllipseHeight = 0;
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);

 minim2 = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim2.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);

}

void draw () {
  noStroke();

//  background (255);
  fill(255,255,255,60);
  rect(width/2,height/2,width,height);
  
  fill (255, 0, 0);
  rectMode (CENTER);
  rect (width/2, height/2, 10, height - 40);
  
  ellipseHeight = (0.9 * prevEllipseHeight) + (0.1 * height - in.mix.level()*1000);
  
  if (ellipseHeight < 35) {
    ellipseHeight = 35;
  }
  
  if (ellipseHeight > height - 35) {
    ellipseHeight = height - 35;
  }
  
  fill (0);
  ellipse (width/2, ellipseHeight, 70, 70);

  prevEllipseHeight = ellipseHeight;
  
  freqChange();
}


void freqChange()
{
  // with portamento on the frequency will change smoothly
  float freq = map(ellipseHeight, 35, height-35, 1500, 60);
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
//  float pan = map(mouseX, 0, width, -1, 1);
//  sine.setPan(pan);
}

