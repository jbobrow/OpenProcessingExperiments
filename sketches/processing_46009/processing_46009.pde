
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;
FFT fftLin;


void setup() {
  size(600, 300);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100);

  minim = new Minim(this);

  jingle = minim.loadFile("lm.aif", 2048);
  jingle.loop();

  fftLin = new FFT(jingle.bufferSize(), jingle.sampleRate());
  fftLin.linAverages(30);
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
}

void draw() {

  float centerFrequency = 0; 
  fftLin.forward(jingle.mix);

  for (int i = 0; i < fftLin.specSize(); i++)
  {
    float newHue= map(fftLin.getBand(i), 0, 1, 0, 180);
    fill(newHue*2.2, 200, 50);
    rect(0, 0, width, height);
  }

  fft.forward(jingle.mix);
  for (int i = 0; i < fft.specSize(); i++)
  {
    float s = map(fft.getBand(i), 0, 275, 0, 300);
    float y = map(fft.getBand(i), 0, 30, 0, 300);
    float x = map(fft.getBand(i*2), 0, 2, 0, 600);
    float c = map(fft.getBand(i), 0, 30, 80, 250);
    fill(c*2.2, 150, 180);
    ellipse(x, y, s, s);
  }
}
void stop()
{
  jingle.close();
  minim.stop();

  super.stop();
}


