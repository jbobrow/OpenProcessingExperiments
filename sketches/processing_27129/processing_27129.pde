

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


class Orb {
  float x, y, r;

  Orb() {
  }

  Orb(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    
  }
}
Orb orb;
PVector velocity;

Minim minim;
AudioOutput out;
SineWave sine;
SineWave sine2;


void setup() {
  size(700, 700);
  smooth();
  orb = new Orb(50, 50, 10);
  velocity = new PVector(0, 0);
  
   minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(100, 0.5, out.sampleRate());
  sine2 = new SineWave(100, 0.3, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(10);
  sine2.portamento(30);
  // add the oscillator to the line out
  out.addSignal(sine);
  out.addSignal(sine2);

  
}
void draw() {
  
  
  float freq = map(orb.y, 0, height, 600, 60);
  sine.setFreq(freq);

float freq2 = map(orb.x, 0, width, 400, 60);
  sine2.setFreq(freq2);
  float pan = map(orb.x, orb.y, width, -1, 1);
  sine.setPan(pan);


//stroke(orb.x/2,orb.y/2,orb.x/2,50);
stroke(orb.y/2,orb.x/2,orb.y/2,50);
strokeWeight(15);
line(orb.x,0,0,orb.y);
line(width,orb.y,orb.x,height);
line(0,orb.y,orb.x,height);
line(width,orb.y,orb.x,0);

line(0,orb.x,orb.y,0);
line(orb.y,height,width,orb.x);
line(orb.y,0,width,orb.x);
line(orb.y,height,0,orb.x);


//cross
stroke(orb.x/2,orb.y/3,orb.x/2,15);
strokeWeight(5);
line(orb.x,0,orb.x,height);
line(orb.y,0,orb.y,height);
line(0,orb.x,width,orb.x);
line(0,orb.y,width,orb.y);
//line(orb.x,0,0,orb.x);
//line(orb.y,0,0,orb.y);
//line(orb.x,height,width,orb.x);
//line(orb.y,height,width,orb.y);

  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);

  // Move orb
  orb.x += velocity.x;
  orb.y += velocity.y;

noStroke();
  fill(255,255,255,0);
  ellipse(orb.x, orb.y, orb.r*2, orb.r*2);
 
  

  if (mousePressed) {
    
    velocity.x = (mouseX-orb.x)/2;
    velocity.y = (mouseY-orb.y)/2;
  }

  if (orb.x > width-orb.r) {
    orb.x = width-orb.r;
    velocity.x *= -1;
  }
  else if (orb.x < orb.r) {
    orb.x = orb.r;
    velocity.x *= -1;
  }
  if (orb.y > height-orb.r) {
    orb.y = height-orb.r;
    velocity.y *= -1;
  }
  else if (orb.y < orb.r) {
    orb.y = orb.r;
    velocity.y *= -1;
  }
}


