
import ddf.minim.analysis.*;
import ddf.minim.*;

// Tripsel 14 Sept 2010
// Replace string in loadFile for your mp3
// Put the mp3 in the data folder
// Run it - use the number keys 1-9 to change the bar height
// Bars only show if they are persistant but not background
// This works best with melodic, tonal songs, not distortion or drums.

Minim minim;
AudioPlayer jingle;
FFT fft;
float [] harmMag;
float [] harmVLP;
int BUFFSIZE = 1024*1;
float HARMFILT = 0.001;
float BANDFILT = 0.02;
int n, volume;

void setup()
{
  size(256, 400);
  minim = new Minim(this);
  jingle = minim.loadFile("arrogant.mp3", BUFFSIZE);
  jingle.play();
  fft = new FFT(BUFFSIZE, 0);
  fft.window(FFT.HAMMING);
  n = (fft.specSize()-1)/4;
  harmMag = new float[n];
  harmVLP = new float[n];
  colorMode(HSB,n);
  noStroke();
  volume = 4;
}

void keyPressed() {
  if(key > '0' && key <= '9')
    volume = 2*(key-'0');
}

void draw()
{
  fft.forward(jingle.mix);
  float [] spec = new float[n];
  for(int i = 0; i < n; i++)
  {
    harmMag[i] = harmMag[i]*(1-HARMFILT) + fft.getBand(i)*HARMFILT;
    harmVLP[i] = harmVLP[i]*(1-BANDFILT) + harmMag[i]*BANDFILT;
    spec[i] = (harmMag[i]/harmVLP[i] - 1)*height*volume;
  }
  background(0,0,0);
  for(int i = 0; i < n; i++)
  {
    if(spec[i]>0)
    {
      fill(i*3/5,n,spec[i]/2);
      rect(i*2-1, height-spec[i], 2, spec[i]);
    }
  }
}

void stop()
{
  // always close Minim audio objects when you finish with them
  jingle.close();
  minim.stop();
 
  super.stop();
}


