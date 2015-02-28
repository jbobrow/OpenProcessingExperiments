
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

void setup()
{

  minim = new Minim(this); 
  jingle = minim.loadFile("Wildhearts - Piano Version.mp3", 1024);
  jingle.play();
  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two and that it means the size of the spectrum
  // will be 512. see the online tutorial for more info.
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
  size(512,300);
  noStroke();
  frameRate(40);
  background(0);
  strokeWeight(1);
}

void draw()
{
  background(0);
  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.right or jingle.left
  stroke(255,0,0);
  fft.forward(jingle.mix);
  fill(255,0,0);
  noStroke();
  translate(0,height/4);
  drawStandardSpectrum();
  drawReversedSpectrum();
  translate(0,height/4);
  translate(-width/2,0);
  drawReversedSpectrum();
  translate(width,0);
  drawStandardSpectrum();
  translate(-width/2,0);
  translate(0,height/4);
  drawStandardSpectrum();
  drawReversedSpectrum();

}

int getPeak()
{
  int maximum=0;
  for(int i = 0; i < fft.specSize(); i++)
  {
    if(fft.getBand(i)>fft.getBand(maximum)) maximum=i;
  }
  return maximum;
}

void drawStandardSpectrum()
{
  for(int i = 0; i < fft.specSize(); i+=4)
  {
    fill(0,map(i,0,fft.specSize(),0,255),0);
    stroke(0,map(i,0,fft.specSize(),255,0),0);
    {
      ellipse(i,0,fft.getBand(i),fft.getBand(i));
    }
  }
}

void drawReversedSpectrum()
{
  for(int i = fft.specSize(); i > 0; i-=4)
  {
    fill(0,map(i,0,fft.specSize(),0,255),0);
    stroke(0,map(i,0,fft.specSize(),255,0),0);
    {
      ellipse(width-i,0,fft.getBand(i),fft.getBand(i));
    }
  }  
}

void mousePressed()
{
  if(jingle.isPlaying()) jingle.pause();
  else jingle.play();
}
void stop()
{
  // always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  
  super.stop();
}

