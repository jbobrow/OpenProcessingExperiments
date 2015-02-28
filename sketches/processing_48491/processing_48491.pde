


import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
import controlP5.*;

ControlP5 controlP5;
Slider2D s;

void setup() {
  size(400,400);
    minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
  controlP5 = new ControlP5(this);
  //Slider2D s = controlP5.addSlider2D("slider",0,10,0,10,5,5, 20,100,100,100);
  s = controlP5.addSlider2D("wave",30,40,100,100);
  s.setArrayValue(new float[] {50, 50});  
  smooth();
}

float cnt;
void draw() {
  background(0);
  float freq = map(s.arrayValue()[1], 0, height/2, 2500, 30);
  sine.setFreq(freq*0.2);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(s.arrayValue()[0], 0, width, -1, 1);
  sine.setPan(pan);
  pushMatrix();
  translate(160,140);
  strokeWeight(1);
  stroke(255,100);
  rect(0,-100, 200,200);
  line(0,0,200, 0);
  stroke(255);
  
  strokeWeight(2);
  for(int i=1;i<200;i++) {
    float y0 = cos(map(i-1,0,s.arrayValue()[0],-PI,PI)) * s.arrayValue()[1]; 
    float y1 = cos(map(i,0,s.arrayValue()[0],-PI,PI)) * s.arrayValue()[1];
    line((i-1),y0,i,y1);
  }
  
  popMatrix();
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

