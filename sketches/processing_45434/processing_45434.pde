
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;
FFT fft;
float height3;
float height23;
float spectrumScale = 2;


void setup()
{
  size(640, 480, P3D);
  colorMode(HSB, 100);
  height3 = height/3;
  height23 = 2*height/3;

  minim = new Minim(this);

  jingle = minim.loadFile("lm.aif", 2048);
  // loop the file
  jingle.loop();

  fftLin = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLin.linAverages(30);
  fftLog = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  fftLog.logAverages(22, 3);
  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());

  rectMode(CORNERS);
}

void draw()
{
  background(0);
  stroke(255);
  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left
  fft.forward(jingle.mix);
  for (int i = 0; i < fft.specSize(); i+=8)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    stroke(map(fft.getBand(i), 0, 2, 0, 255), 255, 255);
    //println(fft.getBand(i));
    strokeWeight(4);
    line(i, 0, i, height);
    //line(i, height, i, height - fft.getBand(i)*4);
  }
  float centerFrequency = 0;
noStroke();
  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fftLin.forward(jingle.mix);

  // draw the full spectrum
  for (int i = 0; i < fftLin.specSize(); i++)
  {
    fill(58, 96, 98);
    float m= map(fftLin.getBand(i), 0, 1, 0, 100);
    ellipse(i, m, random(width), random(height));

    //line(i, height3, i, height3 - fftLin.getBand(i)*spectrumScale);
  }
  noStroke();
  // draw the linear averages
  int w = int(width/fftLin.avgSize());
  for (int i = 0; i < fftLin.avgSize(); i++)
  {
    centerFrequency = fftLin.getAverageCenterFrequency(i);
    float n= map(fftLin.getAvg(i), 0, 1, 0, 200);
    line(random(width), random(height), n, n );
    stroke(231,96,58);
    // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
    // rect(i*w, height23, i*w + w, height23 - fftLin.getAvg(i)*spectrumScale);
  }

  // draw the logarithmic averages
  fftLog.forward(jingle.mix);
  w = int(width/fftLog.avgSize());
  for (int i = 0; i < fftLog.avgSize(); i++)
  {
    centerFrequency = fftLog.getAverageCenterFrequency(i);
    fill(359,96,98);
    // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
    rect(i*w+100, height, i*w + w, height - fftLog.getAvg(i)*spectrumScale);
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


