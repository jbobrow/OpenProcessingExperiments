
// Input FFT
// original code by Marius Watz <http://www.unlekker.net>
// modified by Krister Olsson <http://www.tree-axis.com>

// Showcase for new FFT processing options in Ess v2. 
// Clicking and dragging changes FFT damping

// Created 27 May 2006

import krister.Ess.*;

int bufferSize;
int steps;
float limitDiff;
int numAverages=4;
float myDamp=.6f;
float maxLimit,minLimit;

FFT myFFT;
AudioInput myInput;

void setup () {
  size(700,700);
  smooth();
  noStroke();

  // start up Ess
  Ess.start(this);  

  // set up our AudioInput
  bufferSize=512;
  myInput=new AudioInput(bufferSize);

  // set up our FFT
  myFFT=new FFT(bufferSize*2);
  myFFT.equalizer(true);

  // set up our FFT normalization/dampening
  minLimit=.005;
  maxLimit=.05;
  myFFT.limits(minLimit,maxLimit);
  myFFT.damp(myDamp);
  myFFT.averages(numAverages);

  frameRate(25);         

  myInput.start();
}

void draw() {

  background(0,0,0);
  
  float durchmesser = myFFT.averages[0]*1000 +20;
  fill(255,0,0);
  ellipse(width/2, height/2, durchmesser, durchmesser);

}

public void audioInputData(AudioInput theInput) {
  myFFT.getSpectrum(myInput);
}

