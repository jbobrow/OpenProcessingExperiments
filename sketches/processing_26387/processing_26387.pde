
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

void setup() {
  
  size(800, 400);
  
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 261.63 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(261.63, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 50 milliseconds
  sine.portamento(50);
  // add the oscillator to the line out
  out.addSignal(sine);
}


void draw() {
  
  background(0); 
  noStroke();
  smooth();
    
  float xref = width/2;
  float yref = height;
  float x = xref-mouseX;  
  float y = yref-mouseY;
  float r = sqrt(x*x+y*y);
  
  if (7*width/14<r){
    background(255);
    fill(random(255),random(255),random(255),random(255));
    ellipse(width/2, height, width, width);
    fill(random(255),random(255),random(255),random(255));
    ellipse(width/2, height, 6*width/7, 6*width/7);
    fill(random(255),random(255),random(255),random(255));
    ellipse(width/2, height, 5*width/7, 5*width/7);
    fill(random(255),random(255),random(255),random(255));
    ellipse(width/2, height, 4*width/7, 4*width/7);
    fill(random(255),random(255),random(255),random(255));
    ellipse(width/2, height, 3*width/7, 3*width/7);
    fill(random(255),random(255),random(255),random(255));
    ellipse(width/2, height, 2*width/7, 2*width/7);
    fill(random(255),random(255),random(255),random(255));
    ellipse(width/2, height, width/7, width/7);
  }
  
  else {
    if (3*width/7<r && r<7*width/14) { fill(0); }
    else { fill(#EE82EE); }    
    ellipse(width/2, height, width, width);
    
    if (5*width/14<r && r<3*width/7) { fill(0); }
    else { fill(#4B0082); }   
    ellipse(width/2, height, 6*width/7, 6*width/7);
    
    if (2*width/7<r && r<5*width/14) { fill(0); }
    else { fill(#0000FF); }
    ellipse(width/2, height, 5*width/7, 5*width/7);
    
    if (3*width/14<r && r<2*width/7) { fill(0); }
    else { fill(#008000); }
    ellipse(width/2, height, 4*width/7, 4*width/7);
    
    if (width/7<r && r<3*width/14) { fill(0); }
    else { fill(#FFFF00); }
    ellipse(width/2, height, 3*width/7, 3*width/7);
    
    if (width/14<r && r<width/7) { fill(0); }
    else { fill(#FFA500); }
    ellipse(width/2, height, 2*width/7, 2*width/7);
    
    if (r<width/14) { fill(0); }   
    else { fill(#FF0000); }
    ellipse(width/2, height, width/7, width/7);
  }
}


float DO = 261.63;
float RE = 293.66;
float MI = 329.63;
float FA = 349.23;
float SOL = 392.00;
float LA = 440.00;
float SI = 493.88;
float DO5 = 523.25; 
float[] notas = {DO, RE, MI, FA, SOL, LA, SI, DO5};


void mouseMoved() {
  
  float xref = width/2;
  float yref = height;
  float x = xref-mouseX;  
  float y = yref-mouseY;
  float r = sqrt(x*x+y*y);
  
  int nota = int(map(r, 0, height, 0, 7));
  
  float freq;
  if (r>height) { freq = notas [7]; }
  else { freq = notas [nota]; }
  sine.setFreq(freq);
}

