
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput output;
SawWave sawtooth;
LowPassFS lowpass;

void setup(){
  size(800,200);
  minim = new Minim(this);
  output = minim.getLineOut(minim.STEREO, 512);
  sawtooth = new SawWave(440, 1, 44100);
  lowpass = new LowPassFS(200, 44100);
  output.addSignal(sawtooth);
  output.addEffect(lowpass);
}

void draw(){
  lowpass.setFreq(map(mouseX, 0, width, 60, 5000));
}
