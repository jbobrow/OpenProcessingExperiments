
import processing.pdf.*;

//import krister.ess

// Input FFT
// original code by Marius Watz <http://www.unlekker.net>
// modified by Krister Olsson <http://www.tree-axis.com>

// Showcase for new FFT processing options in Ess v2. 
// Clicking and dragging changes FFT damping

// Created 27 May 2006

import krister.Ess.*;


boolean switchIncrease=true;
int lineX=0;
int lineY=0;
int bufferSize;
int steps;
float limitDiff;
int numAverages=32;
int colorX=0;
float myDamp=.1f;
float maxLimit,minLimit;

FFT myFFT;
AudioInput myInput;


void setup () {
  size(700,400);

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

  // get the number of bins per average 
  steps=bufferSize/numAverages;

  // get the distance of travel between minimum and maximum limits
  limitDiff=maxLimit-minLimit;

  frameRate(60);         
for(int i=0; i<numAverages; i++)
  myInput.start();
}

void draw() {
  //background(188);
  
  fill(150,20,20,20);
  rect(0,0,530,530);
  strokeWeight(5);
  //line(lineX,0,mouseX,mouseY);

  //drawcolor lines
  if (mousePressed == true){

    if (switchIncrease==true){
      lineX++;
    } 
    if (switchIncrease==false){
      lineX--;
    }
    if(lineX>300){
  switchIncrease=false; 
  }
  if(lineX<0){
  switchIncrease=true; 
    }
  }

  // draw the waveform 

  //stroke(255,100);
  int interp=(int)max(0,(((millis()-myInput.bufferStartTime)/(float)myInput.duration)*myInput.size));

  for (int i=0;i<bufferSize;i++) {
    float left=160;
    float right=160;

    if (i+interp+1<myInput.buffer2.length) {
      left-=myInput.buffer2[i+interp]*50.0;
      right-=myInput.buffer2[i+1+interp]*50.0;
    }

    //line(10+i,left,11+i,right);
  }

  //noStroke();
  //fill(255,128);//color of wave

  // draw the spectrum

  for (int i=0; i<bufferSize; i++) {
    //rect(10+i,10,1,myFFT.spectrum[i]*200);
  }

  // draw our averages
  for(int i=0; i<numAverages; i++) {
    fill(255,128);
    strokeWeight(10);
    stroke(255);
    //rect(10+i*steps,(int)(10+myFFT.maxAverages[i]*200),steps,1);
    strokeWeight(1);
    fill(0);
    line(10+i*steps,(int)(10+myFFT.maxAverages[i]*200)+50,mouseX,mouseY);
    line(10+i*steps,(int)(10+myFFT.maxAverages[i]*200)+100,mouseX,mouseY);
    line(10+i*steps,(int)(10+myFFT.maxAverages[i]*200)+100,10+i*steps,(int)(10+myFFT.maxAverages[i]*200)+50);
    //rect(10+i*steps,10,1,200);
    //rect(10+i*steps,(int)(10+myFFT.maxAverages[i]*200),steps,1);
  }
  // draw the range of normalization
  rect(600,10,50,1);
  rect(600,210,50,1);

  float percent=max(0,(myFFT.max-minLimit)/limitDiff);
  
  fill(255,128);
  rect(600,(int)(11+198*percent),50,1);
  rect(600,11,50,(int)(198*percent));
  
 

}





public void audioInputData(AudioInput theInput) {
  myFFT.getSpectrum(myInput);
}


