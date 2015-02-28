
import processing.opengl.*;

import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;
float height3;
float height23;
PImage bg;
int seconds;

void setup()
{
  seconds=second();
  bg = loadImage("TheRevelry.jpg");
  size(240,240, OPENGL);
  height3 = height/3;
  height23 = 2*height/3;
  minim = new Minim(this); 
  jingle = minim.loadFile("04-Pirates.mp3", 1024);
  jingle.loop();
  // loop the file
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
  fftLog.logAverages(22,3);
  noStroke();
}
 
void draw()
{
  background(0);
  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fftLin.forward(jingle.mix);
  // draw the logarithmic averages
  fftLog.forward(jingle.mix);
  int w = int(width/fftLog.avgSize());
  for(int i = 0; i < fftLog.avgSize(); i++)
  {
    translate(0,0,-fftLog.getAvg(i));
    beginShape();
      texture(bg);
      vertex(i*w,0,i*w,0);
      vertex(i*w,height,i*w,bg.height);
      vertex(i*w+w,height,i*w+w,bg.height);
      vertex(i*w+w,0,i*w+w,0);
    endShape(CLOSE);
    translate(0,0,fftLog.getAvg(i));
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


