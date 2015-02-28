
/*
Program: Spectrogram
Author: Boon Choong Chuan
Created: 2009-09-21

http://en.wikipedia.org/wiki/Spectrogram
http://processing.org/reference/
http://processing.org/reference/libraries/
http://code.compartmental.net/tools/minim/
*/

import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer jingle;
FFT fftLin;
int xPos = 0;
int hueLimit = 160;

void setup()
{
  // create a screen width=512, height=256
  size(512, 256);
 
  // create a minim audio application object
  minim = new Minim(this);

  // create a file object (can be a MP3 file or a WAV file)
  //jingle = minim.loadFile("jingle.mp3", 512);
  jingle = minim.loadFile("sound_voices.wav", 512);

  // loop the file
  jingle.loop();
  
  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fftLin = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLin.linAverages(30);
}
 
void draw()
{
  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fftLin.forward(jingle.mix);

  for(int i = 0; i < fftLin.specSize(); i++)
  {
     float hueValue = hueLimit - map((fftLin.getBand(i)*32), 0, 256, 0, hueLimit);
     // colorMode is HSB, the range for hue is 256, for saturation is 100, brightness is 100.
     colorMode(HSB, 256, 100, 100);
     // color for stroke is specified as hue, saturation, brightness.
     stroke(int(hueValue), 100, 80);
     // plot a point using the specified stroke 
     point(xPos, i);
  }    

  // increment the x position
  xPos = xPos + 1;
  // wrap around at the screen width
  if (xPos > width) {
     xPos = 0;
  }
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  jingle.close();
  // always stop Minim before exiting
  minim.stop();
  //super.stop();
}

