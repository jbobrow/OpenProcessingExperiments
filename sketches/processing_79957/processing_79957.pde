
/*
  A dead simple of the 
*/
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

static int SampleRate = 44100; // Assume 44.1Khz Sample Rate
static int SampleSize = 1024;

Minim minim;
FFT fft;
AudioInput lineIn;

float[][] EnergyHistory = new float[10][43];
float[] AverageEnergy = new float[10];
float[] r = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
void setup()
{
  size(1024, 600);
  frameRate(60);
  smooth();
  minim = new Minim(this);
  lineIn = minim.getLineIn(Minim.STEREO, SampleSize);
  fft = new FFT(SampleSize, SampleRate);
  fft.window(FFT.HAMMING); // HAMMING-SANDWICH
  fft.logAverages(43, 1);
}

void draw()
{  
  fft.forward(lineIn.mix);
  for(int i = 0; i < 10; i++)
  {
    AverageEnergy[i] = 0;
    for(int j = 42; j > 0; j--)
    {
      AverageEnergy[i] += EnergyHistory[i][j];
      EnergyHistory[i][j] = EnergyHistory[i][j-1];
    }
    AverageEnergy[i] /= 43;
    EnergyHistory[i][0] = fft.getAvg(i);
  }
  
  background(0);
  stroke(66);
  strokeWeight(5);
  for(int i = 0; i < SampleSize/4; i++)
  {
    line(i*4, height-fft.getBand(i), (i*4)+4, height-fft.getBand(i+1));
  }  
  stroke(33);
  strokeWeight(1);
  for(int i = height/10; i < height; i+=height/10)
  {
    line(0, i, width, i);
  }  
  noStroke();
  for(int i = 0; i < 10; i ++)
  {
    r[i] *= .95f;
    if(EnergyHistory[i][0] > 1.75f * AverageEnergy[i])
    {
      fill(33, 33, 255);
      r[i] = 50;
    }
    else
      fill(128, 128, 128);    
    rect(0, i * 60.0f, EnergyHistory[i][0], 60.0f);
    //rect(0, i * 60.0f, AverageEnergy[i], 60.0f);
    ellipse(width - 30, 30 + (i * 60.0f), r[i], r[i]);
  }
}



