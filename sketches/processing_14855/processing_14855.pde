
/**
  * This sketch demonstrates how to find the center frequency of both a normal spectrum band and an average band.
  * <p>
  * From top to bottom:
  * <ul>
  *  <li>The full spectrum.</li>
  *  <li>The spectrum grouped into 30 linearly spaced averages.</li>
  *  <li>The spectrum grouped logarithmically into 10 octaves, each split into 3 bands.</li>
  * </ul>
  *
  * Moving the mouse across the sketch will highlight a band in each spectrum and display what the center 
  * frequency of that band is. 
  */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;
float height3;
float height23;
float spectrumScale = 2;

PFont font;

void setup()
{
  size(640, 480, P3D);
  height3 = height/3;
  height23 = 2*height/3;

  minim = new Minim(this);
  minim.debugOn();
  jingle = minim.loadFile("jingle.mp3", 2048);
  // loop the file
  jingle.loop();
  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fftLin = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLin.linAverages(30);
  fftLog = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  fftLog.logAverages(22, 3);
  rectMode(CORNERS);
  
  font = loadFont("ArialMT-12.vlw");
  
  textMode(SCREEN);
}

void draw()
{
  background(0);
  
  textFont(font);
 
  float centerFrequency = 0;
  
  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fftLin.forward(jingle.mix);
 
  noFill();
  // draw the full spectrum
  for(int i = 0; i < fftLin.specSize(); i++)
  {
    if ( i == mouseX )
    {
      centerFrequency = fftLin.indexToFreq(i);
      stroke(255, 0, 0);
    }
    else
    {
        stroke(255);
    }
    line(i, height3, i, height3 - fftLin.getBand(i)*spectrumScale);
  }
  
  fill(255);
  text("Spectrum Center Frequency: " + centerFrequency, 5, 15);
  
  noStroke();
  // draw the linear averages
  int w = int(width/fftLin.avgSize());
  for(int i = 0; i < fftLin.avgSize(); i++)
  {
    if ( mouseX >= i*w && mouseX <= i*w + w )
    {
      centerFrequency = fftLin.getAverageCenterFrequency(i);
      fill(255);
      text("Linear Average Center Frequency: " + centerFrequency, 5, 15 + height3);
      fill(255, 0, 0);
    }
    else
    {
        fill(255);
    }
    // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
    rect(i*w, height23, i*w + w, height23 - fftLin.getAvg(i)*spectrumScale);
  }
  
  // draw the logarithmic averages
  fftLog.forward(jingle.mix);
  w = int(width/fftLog.avgSize());
  for(int i = 0; i < fftLog.avgSize(); i++)
  {
    if ( mouseX >= i*w && mouseX <= i*w + w )
    {
      centerFrequency = fftLog.getAverageCenterFrequency(i);
      fill(255);
      text("Logarithmic Average Center Frequency: " + centerFrequency, 5, 15 + height23);
      fill(255, 0, 0);
    }
    else
    {
        fill(255);
    }
    // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
    rect(i*w, height, i*w + w, height - fftLog.getAvg(i)*spectrumScale);
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  jingle.close();
  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}

