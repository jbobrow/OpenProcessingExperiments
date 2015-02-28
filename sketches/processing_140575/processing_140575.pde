
/**
 * Adapted from Minim "SoundSpectrum" Example
 *
 * other things:
 *  
 *  If you want like a "trail" thing for each "piano key", you will need an array for x and y of
 *  each place where that thing has been drawn. So maybe look at the array draw example:
 *    http://rorys.webfactional.com/creative-computing/2014-spring/week06_hw_arraydraw.pde
 *  for an example of how to do that.
 *
 *  Maybe look at the File > Examples > Topics > Motion > MovingOnCurves
 *  for an example of how to do complex curving motion.
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
  
  // TODO : change the name of this file to your sound file.
  // Make sure you put that sound file in your sketch's "data" directory

  jingle = minim.loadFile("jingle.mp3", 1024);

  // loop the file
  jingle.loop();

  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fftLin = new FFT( jingle.bufferSize(), jingle.sampleRate() );

  // calculate the averages by grouping frequency bands linearly. use 30 averages.
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
    while ( i < fftLin.avgSize () ) {

      fill(255);

      // TODO: focus on changing the drawing code in here.
      // Use the same variables as being used here:
      // i, w, height23, spectrumScale
      // and probably most importantly: fftLin.getAvg(i)
      // which represents the relative volume of the "piano key" indicated by "i"
      
      // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
      rect(i*w, height23, i*w + w, height23 - fftLin.getAvg(i)*spectrumScale);

      i = i + 1;
    }
  }
}
