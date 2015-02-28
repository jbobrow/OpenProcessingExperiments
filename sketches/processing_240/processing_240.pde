
//import krister.ess



import krister.Ess.*;

int bufferSize;
int steps;
float limitDiff;
int numAverages=10;
int colorX=0;
float myDamp=.1f;
float maxLimit,minLimit;

FFT myFFT;
AudioInput myInput;

void setup () {
  size(530,100);

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

  myInput.start();
}

void draw() {
  //background(188);
  //fill(255,0,0);
 // rect(0,0,530,221);
  fill(123,234,255,10);
  rect(-20,-20,600,221);
  strokeWeight(1);
  //stroke(0);
  

  // draw the waveform 

  //stroke(255,100);
  int interp=(int)max(0,(((millis()-myInput.bufferStartTime)/(float)myInput.duration)*myInput.size));

  for (int i=0;i<bufferSize;i++) {
    float left=50;
    float right=50;

    if (i+interp+1<myInput.buffer2.length) {
      left-=myInput.buffer2[i+interp]*100;
      right-=myInput.buffer2[i+1+interp]*100;
    }

    line(10+i,left,11+i,right);
  }

  
 }

public void audioInputData(AudioInput theInput) {
  myFFT.getSpectrum(myInput);
}


