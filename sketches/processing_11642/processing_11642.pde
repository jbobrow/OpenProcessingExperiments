
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

// this is the most unnerving thing i've ever made

Minim minim;
AudioOutput out;
SawWave sine;
LowPassSP lowpass;

PImage bg;
float step = PI/128;

void setup() {
  size(480,480);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, 256);
  // freq = 440, ampl = 1, sample rate = same as out
  lowpass = new LowPassSP(200, 22050);
  sine = new SawWave(220, 1, 22050);
  out.addSignal(sine);
  out.addEffect(lowpass);
  
  noFill();
  translate(width/2, height/2);
  smooth();
  for (float t = 0; t < 4*PI; t += step) {
    rotate(step);
    stroke(0);
//    ellipse(0, 0, (t * 200), (t * 200));
    stroke(random(255));
    line(0, 0, 0, height);
    t += step;
  }
  bg = get();
}

float t = 0;
float scl = 2;

void draw() {
  translate(width/2, height/2); // bring the origin to the center
  rotate(t); // rotate
  translate(-width/2, -height/2); // come back
  scl = constrain(random(scl-0.1, scl+0.1), 1.5,3);

  sine.setFreq(110*scl);
  
  scale(scl);
  translate(-width/(2*scl), -height/(2*scl));
  image(bg, 0, 0);
  t += random(-step, step);
}

void keyPressed() {
   if (key == 'a') {
     t -= step;
   } else if (key == 'd') {
     t += step;
   } else if (key == 'm') {
     out.mute();
   } else if (key == 'n') {
     out.unmute();
   }
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}

