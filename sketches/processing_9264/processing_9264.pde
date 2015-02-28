
import ddf.minim.*;
import ddf.minim.signals.*;
//audio stuff
Minim minim;
AudioOutput out;
SineWave sine;
boolean once = true;
//visual stuff
int [] xpos = new int[50];
int [] ypos = new int[50];

void setup() {
  //visual
  size(500, 500);
  colorMode(HSB);
  smooth();
  //details for minim, line out with oscillator, speed set to portamento and added
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(10);
  out.addSignal(sine);
  

}

void draw () {
  background (mouseX, mouseY, 100);
}



void mouseMoved () {
  float freq = map(mouseY, 0, height, 1500, 60);
  sine.setFreq(freq);
  float pan = map(mouseX, 0, width, -1, 1);
  sine.setPan(pan);
}

void stop () {
  out.close();
  minim.stop();
  
  super.stop();
}

