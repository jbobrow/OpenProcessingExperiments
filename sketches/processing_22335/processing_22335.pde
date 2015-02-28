
/**
based on bubbles by
Nikolaus Gradwohl <a href="http://www.local-guru.net/blog/">Guru</a>
with help from Professor Economos
the rest done by Erin Kopach
dedicated to Victoria Rummler
*/


import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

FFT fft;

float easing = 0.09;
float easedVal;
float valL;

Bubble[] bubbles;

void setup() {
  
  size(800,800);
  //size (screen.width, screen.height);
 
  minim = new Minim(this);

  minim.debugOn();

  in = minim.getLineIn(Minim.STEREO, 512);
  
  fft = new FFT(in.bufferSize(), in.sampleRate());
  
  smooth();
  bubbles = new Bubble[80];
  for (int i=0; i < bubbles.length; i++)  {
    float r = random(10, 100);
    bubbles[i] = new Bubble(random(width), height + r, r, random(3,2));
  }
}

void draw() {
  
  fft.forward(in.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
   
    valL = fft.getBand(i)*100;
    valL = constrain(valL,0,1);
    valL = map(valL,0,1,2,10);


    float targetVal = valL;
    easedVal += (targetVal - easedVal) * easing; 
    println (easedVal);
                                            
  }

  fft.window(FFT.HAMMING);
 
  background(240);
  
  for (int i=0; i < bubbles.length; i++)  {
    bubbles[i].update();
    bubbles[i].MYdraw(easedVal);
    if (bubbles[i].y < -1 * bubbles[i].r) {
      float r = random(easing, 100);
     // println (easing);
      bubbles[i] = new Bubble ( random(width), float(height) + easedVal, r, random(1,2+easing));
    }
  }
}


class Bubble {
  float x, y, r, s;
  float rCol,gCol,bCol;
  Bubble( float x, float y, float r, float s ) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.s = s;
    rCol = random(100);
    gCol = random(255);
    bCol = random(255);
  }
  
  void update() {
    y -= s;
  }
  
  void MYdraw(float tempSndChng) {
   // stroke( 160,160,255, 50*s );
    
 float sndChng =tempSndChng;


float incremento = +9000;
float mincol = 0, maxcol = 255;

strokeWeight(10);
stroke(255,100);
 fill(rCol-sndChng*random(1),gCol-sndChng*random(2),bCol-sndChng*random(1),90);
    ellipse( x, y, r+sndChng*5, r+sndChng*5 );
  }
}


