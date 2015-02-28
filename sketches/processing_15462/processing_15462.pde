
//Still ends up with a null pointer exception

import ddf.minim.*;
import ddf.minim.signals.*;

Minim min;
AudioOutput play;
SineWave sine;

import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

void setup()
{
  size(300,300);
  min = new Minim(this);
  play = min.getLineOut(Minim.STEREO);
  sine = new SineWave(261.63, .5, play.sampleRate());
  play.addSignal(sine);
}


void draw()
{
  fill(0);
  rect(0, 0, 300, 37.5);
  fill(20);
  rect(0, 37.5, 300, 37.5);
  fill(40);
  rect(0, 75, 300, 37.5);
  fill(60);
  rect(0, 112.5, 300, 37.5);
  fill(80);
  rect(0, 150, 300, 37.5);
  fill(100);
  rect(0, 187.5, 300, 37.5);
  fill(120);
  rect(0, 225, 300, 37.5);
  fill(140);
  rect(0, 262.5, 300, 37.5);
  int val = arduino.analogRead(3);
  if (val <= 128)
  {
    sine.setFreq(261.63);
  }
  else if (val <=256)
  {
    sine.setFreq(293.66);
  }
  else if (val <=384)
  {
    sine.setFreq(329.63);
  }  
  else if (val <=512)
  {
    sine.setFreq(349.23);
  }
  else if (val <=640)
  {
    sine.setFreq(392.00);
  }
  else if (val <=768)
  {
    sine.setFreq(440.00);
  }
  else if (val <=896)
  {
    sine.setFreq(493.88);
  }
  else
  {
    sine.setFreq(523.25);
  }
}

