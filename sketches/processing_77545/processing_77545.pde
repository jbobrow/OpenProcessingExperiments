
import ddf.minim.*;
import ddf.minim.signals.*;
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

Minim minim;
AudioOutput out;
SineWave sine;

color off = color(4, 79, 111);
color on = color(84, 145, 158);

void setup()
{
  size(512, 200, P2D);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  for (int i =0; i<=13;i++)
  arduino.pinMode(i, Arduino.INPUT);
  
  
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
}

void draw()
{
  background(125, 100, 146);
  stroke(255);
  // draw the waveforms
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
  
  // with portamento on the frequency will change smoothly
  float freq = map(arduino.analogRead(0)/2, 0, height, 1500, 60);
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(arduino.analogRead(0)/2, 0, width, -1, 1);
  sine.setPan(pan);
}

/*void mouseMoved()
{
  println(arduino.analogRead(0));
  // with portamento on the frequency will change smoothly
  float freq = map(arduino.analogRead(0)/2, 0, height, 1500, 60);
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(arduino.analogRead(0)/2, 0, width, -1, 1);
  sine.setPan(pan);
}*/

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}
