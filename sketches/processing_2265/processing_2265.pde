
//This one is functional for processing but doesn't include the mods for reading from arduino
//
// Created  February 5th 2009
//code borrowed from this example http://www.processing.org/hacks/hacks:sincoslookup
/*
import processing.serial.*;

Serial port;  // Create object from Serial class
int val;      // Data received from the serial port
int[] values;
*/

import krister.Ess.*;

int bufferSize;
int steps;
float limitDiff;
int numAverages=32;
float myDamp=0.01f;
float maxLimit,minLimit;
float kurve = 0.3;

FFT myFFT;
AudioInput myInput;

//from per
float radius;
float scaleRadius;
// declare arrays and params for storing sin/cos values 
float sinLUT[];
float cosLUT[];
 
float SC_PRECISION = 0.5f;
 
// caculate reciprocal for conversions
float SC_INV_PREC = 1/SC_PRECISION;
 
// compute required table length
int SC_PERIOD = (int) (360f * SC_INV_PREC);

void setup () {
  size(700,500);
  smooth();
  background(20, 84+random(8,12), 210);
  
  // important call to initialize lookup tables
  initSinCos(); 
   
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
 // myFFT.damp(myDamp);
  myFFT.averages(numAverages);

  frameRate(32);         

  myInput.start();
}

void draw() {
  
  noStroke();
  fill(255,128);

  // draw the averages  
  for(int i=0; i<numAverages; i++) {
   // fill(random(0,15), random(0,255), random(0,15),128);   
    
     // take the average of the audio input and use it to scale the size of the rings
     scaleRadius = myFFT.maxAverages[i]*100;
     
     println("scaleRadius = " +  scaleRadius);
     
     // modulate the current radius
     radius=50+50*sinLUT[millis()%SC_PERIOD];
     println("radius " +  radius);
     
      //if it gets too loud clear the screen
      println("scaleRadius" + scaleRadius);
      //on mouse press redraw the background
      if (mousePressed == true) {
       for( int j = height; j > 0; j--) { 
        stroke(20, 84+j/10*random(.8,1.2), 210);
        line(0, j, width, j);
        }
        
      }
  }
   
  // draw a circle made of points (every 5 degrees) 
  for(int i=0; i<360; i+=5) {
 
    // convert degrees into array index:
    // the modulo operator (%) ensures periodicity 
    int theta=(int)((i*SC_INV_PREC) % SC_PERIOD);
 
    // draw the circle around mouse pos
   // fill(#dddddd, 25);
    stroke(random(240,250), random(120,200));
    point( mouseX+radius*cosLUT[theta]*scaleRadius, mouseY+radius*sinLUT[theta]*scaleRadius);
  
}
}
public void audioInputData(AudioInput theInput) {
  myFFT.getSpectrum(myInput);
}

// init sin/cos tables with values
// should be called from setup()
void initSinCos() {
 
  sinLUT = new float[SC_PERIOD];
 
  cosLUT = new float[SC_PERIOD];
 
  for (int i = 0; i < SC_PERIOD; i++) {
 
    sinLUT[i] = (float) Math.sin(i * DEG_TO_RAD * SC_PRECISION);
 
    cosLUT[i] = (float) Math.cos(i * DEG_TO_RAD * SC_PRECISION);
 
  }
 
}
 


