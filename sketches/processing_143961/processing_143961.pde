
// HW 3/27/14
// Sound

float s;

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil wave;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil( 440, 0.5f, Waves.SINE );
  wave.patch( out );
  size(400,400);
  s = 10.0;
}

void draw() {
  background(255);
  translate(width/2,height/2);
  noStroke();
  fill(50,60,20);
  ellipse(0,0,s,s);
}

void mouseMoved() {
  // usually when setting the amplitude and frequency of an Oscil
  // you will want to patch something to the amplitude and frequency inputs
  // but this is a quick and easy way to turn the screen into
  // an x-y control for them.
  
  float amp = map( mouseY, 0, height, 1, 0 );
  wave.setAmplitude( amp );
  
  float freq = map( mouseX, 0, width, 110, 880 );
  wave.setFrequency( freq );
}


void keyPressed() {
  if ( keyCode == UP ) {
    float amp = map( s-=10, 0, s-=10, 1, 0 );
    wave.setAmplitude( amp );
  }
  else if ( keyCode == DOWN ) {
    float amp = map( s+=10, 0, s+=10, 1, 0 );
    wave.setAmplitude( amp );
  }
}


