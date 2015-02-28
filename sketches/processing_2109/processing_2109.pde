
import controlP5.*;
import ddf.minim.*;
import ddf.minim.signals.*;

ControlP5 gui;
public int freq = 440;
Minim minim;
AudioOutput out;
SineWave sine;

void setup()
{
  size( 200, 100 );
  initializeMinim();
  initializeGui();
}

void initializeMinim()
{
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 2048);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
}

void initializeGui()
{
  gui = new ControlP5(this);
  gui.addNumberbox("freq", freq, 50, 50, 100, 14 ); 
}

void draw() {
  background(0);
  sine.setFreq(freq);
}

/**
 * For Minim
 **/
void stop()
{
  out.close();
  minim.stop();
  super.stop();
}


