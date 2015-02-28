
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;
float height3;
float height23;
float spectrumScale = 2;

PFont font;

void setup()
{
  size(640, 480, P3D);
  height3 = height/3;
  height23 = 2*height/3;


  minim = new Minim(this);
 
  jingle = minim.loadFile("windows.aif", 2048);
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

  rectMode(CORNERS);
  font = loadFont("AkkuratLightPro-Regular-12.vlw");
  textMode(SCREEN);
}

void draw()
{
  background(0);

  textFont(font);

  float centerFrequency = 0;

  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fftLin.forward(jingle.mix);


  // draw the full spectrum
  for (int i = 0; i < fftLin.specSize(); i++)
  {
    fill(252,245,8,200);
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
    float n= map(fftLin.getAvg(i),0,1,0,200);
    line(random(width),random(height), n,n );
    stroke(255,250);
    // draw a rectangle for each average, multiply the value by spectrumScale so we can see it better
   // rect(i*w, height23, i*w + w, height23 - fftLin.getAvg(i)*spectrumScale);
  }

  // draw the logarithmic averages
  fftLog.forward(jingle.mix);
  w = int(width/fftLog.avgSize());
  for (int i = 0; i < fftLog.avgSize(); i++)
  {
    centerFrequency = fftLog.getAverageCenterFrequency(i);
    fill(255);
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


