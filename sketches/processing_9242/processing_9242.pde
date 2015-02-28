
//http://processingjs.org/
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
boolean once = true;


float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

void setup() {
  size(500,500);
  strokeWeight(10);
  frameRate(15);
  X = width /2;
  Y = height /2;
  nX = X;
  nY = Y;
  
  colorMode(HSB);
  //details for minim, line out with oscillator, speed set to portamento and added
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(10);
  out.addSignal(sine);
  
}

//main loop 
void draw() {
  
  radius = radius + sin( frameCount / 4);
  
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
  
  background(mouseX, mouseY, 100);
  
  fill (0,121,84);
  
  stroke(255);
  
  ellipse( X, Y, radius, radius);
}

void mouseMoved () {
  nX = mouseX;
  nY = mouseY;
  
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

