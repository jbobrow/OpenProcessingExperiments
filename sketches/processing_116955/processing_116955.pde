
//128 linearly spaced averages are requested and then those are drawn as rectangles.

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer tune;
FFT fft;

void setup()
{
  size(600, 400, P2D);
  minim = new Minim(this);
  
  tune = minim.loadFile("Enki.mp3", 2048);
  // loop the file
  tune.loop();
  // create an FFT object that has a time-domain buffer the same size as tune's sample buffer
  // and a sample rate that is the same as tune's
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fft = new FFT(tune.bufferSize(), tune.sampleRate());
  // use 128 averages.
  // the maximum number of averages we could ask for is half the spectrum size. 
  fft.linAverages(128);
  rectMode(CORNERS);
}

void draw()
{
  noStroke();
  fill(255);
  // perform a forward FFT on the samples in tune's mix buffer
  // note that if tune were a MONO file, this would be the same as using tune.left or tune.right
  fft.forward(tune.mix);
  int w = int(fft.specSize()/128);
  for(int i = 0; i < fft.avgSize(); i++)
  {
    // draw a rectangle for each average, multiply the value by 5 so we can see it better
    rect(i*w, height, i*w + w, height - fft.getAvg(i)*30);
    
  }
  fill(0,0,0,15);
  rect(0,0,width,height);
}

void stop()
{
  // always close Minim audio classes when you finish with them
  tune.close();
  minim.stop();
  
  super.stop();
}

