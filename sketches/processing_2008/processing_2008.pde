

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
PulseWave wav;
PFont font;
void setup()
{
  size(512, 200);
  smooth();
  font = loadFont("04b30-14.vlw");
  minim = new Minim(this); 
  out = minim.getLineOut(Minim.STEREO);
  wav = new PulseWave(440, 0.5, out.sampleRate());
  wav.portamento(200);
  wav.setFreq(speed);
  out.addSignal(wav);
  textAlign(CENTER);
  textFont(font,16);
  stroke(255);
  fill(255);
}

float speed = 100.0;

void draw(){
  background(0);
  speed+=(100.0-speed)/10.0;
  if(keyPressed){
    if(key==' '){
      speed+=(1000.0-speed)/50.0;
    } 
  }

  wav.setFreq(speed);
  text("Car Speed:"+(int)speed,width/2+random(-2.0*speed/100.0,2.0*speed/100.0),height/2+random(-2.0*speed/100.0,2.0*speed/100.0));
}



void mouseMoved()
{
  float pan = map(mouseX, 0, width, -1, 1);
  wav.setPan(pan);
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}


