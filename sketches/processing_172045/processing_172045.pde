
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer mySong;
FFT         fftL;
FFT         fftR;

int _scale = 80;

void setup()
{
  size(854, 480);
  colorMode(HSB, 360, 100, 100, 256);
  frameRate(60);
  smooth();
  strokeWeight(1);
  minim = new Minim(this);
  mySong = minim.loadFile("oneChordv4.mp3", 1024);
  mySong.loop();
  fftL = new FFT( mySong.bufferSize(), mySong.sampleRate() );
  fftR = new FFT( mySong.bufferSize(), mySong.sampleRate() );
}

void draw()
{
  background(#000000);

  fftL.forward( mySong.left );
  for (int i = 0; i < fftL.specSize()-1; i++)
  {
    float adjust = log(i+1)/log(2);
    float valueOnBand = log(fftL.getBand(i)*adjust+1)*_scale;
    float valueOnNextBand = log(fftL.getBand(i+1)*adjust+1)*_scale;
    float x = map(i, 0, fftL.specSize(), 0, 853);
    float xNext = map(i+1, 0, fftL.specSize(), 0, 853);
    stroke(67, 80, 90,200);
    line( x, height - valueOnBand, xNext, height - valueOnNextBand );
  }

  fftR.forward( mySong.right );
  for (int i = 0; i < fftR.specSize()-1; i++)
  {
    float adjust = log(i+1)/log(2);
    float valueOnBand = log(fftR.getBand(i)*adjust+1)*_scale;
    float valueOnNextBand = log(fftR.getBand(i+1)*adjust+1)*_scale;
    float x = map(i, 0, fftR.specSize(), 0, 853);
    float xNext = map(i+1, 0, fftR.specSize(), 0, 853);
    stroke(179, 80, 90);
    line( x, height - valueOnBand, xNext, height - valueOnNextBand );
  }
}


