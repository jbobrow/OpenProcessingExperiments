
/**
 *
 * This is adapted from the Minim "SoundSpectrum" example
 *
 * TODO: 
 * Look at the "motion" examples from class for some ideas of how to move stuff:
 *    http://rorys.webfactional.com/creative-computing/2014-spring/week04.html
 * for example:
 *    http://rorys.webfactional.com/creative-computing/2014-spring/week04_motion_07.pde
 */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;

float height3;
float height23;
float spectrumScale = 4;

PFont font;

void setup()
{
  size(512, 480);
  height3 = height/3;
  height23 = 2*height/3;

  minim = new Minim(this);
  
  // TODO: to change the song change the filename here
  // (don't forget to load the file into your sketch)
  jingle = minim.loadFile("jingle.mp3", 1024);

  // loop the file
  jingle.loop();

  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fftLin = new FFT( jingle.bufferSize(), jingle.sampleRate() );

  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  // TODO: this sets the number of "piano keys" ... you can change this to anything you want
  fftLin.linAverages( 30 );

  // create an FFT object for calculating logarithmically spaced averages
  fftLog = new FFT( jingle.bufferSize(), jingle.sampleRate() );

  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  fftLog.logAverages( 22, 3 );

  rectMode(CORNERS);
  font = loadFont("ArialMT-12.vlw");
}

void draw()
{
  background(0);

  textFont(font);
  textSize( 18 );

  float centerFrequency = 0;

  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fftLin.forward( jingle.mix );
  fftLog.forward( jingle.mix );


  // no more outline, we'll be doing filled rectangles from now
  noStroke();

  // draw the linear averages
  {
    // since linear averages group equal numbers of adjacent frequency bands
    // we can simply precalculate how many pixel wide each average's 
    // rectangle should be.
    int w = int( width/fftLin.avgSize() );
    int i = 0;
    while ( i < fftLin.avgSize() )
    {
      fill(255);

      // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
      rect(i*w, height23, i*w + w, height23 - fftLin.getAvg(i)*spectrumScale);
      
      // TODO: experiment with drawing other stuff using the above variables:
      // i, w, height23, spectrumScale
      
      // Probably the most important thing to use here is:
      //    fftLin.getAvg(i)
      // which gives you a number corresponding to the volume of that "piano key" in this
      // moment.
      
      
      i = i + 1;
    }
  }
}

