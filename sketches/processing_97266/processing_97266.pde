
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.effects.*;
Minim minim;
FFT fftLin;
AudioInput in;
BandPass bpf;
BeatDetect bd;

Note[] notes= {
  new Note("A3", 220), 
  new Note("A#3/Bb3", 233.08), 
  new Note("B3", 246.94), 
  new Note("C4", 261.63), 
  new Note("C#4/Db4", 277.18), 
  new Note("D4", 293.66), 
  new Note("D#4/Eb4", 311.13), 
  new Note("E4", 329.63), 
  new Note("F4", 349.23), 
  new Note("F#4/Gb4", 369.99), 
  new Note("G4", 392.00), 
  new Note("G#4/Ab4", 415.30), 
  new Note("A4", 440), 
  new Note("A#4/Bb4", 466.16), 
  new Note("B4", 493.88), 
  new Note("C5", 523.25), 
  new Note("C#5/Db5", 554.37), 
  new Note("D5", 587.33), 
  new Note("D#5/Eb5", 622.25), 
  new Note("E5", 659.25)
  };

  float height3;
float spectrumScale = 6;
float centerFrequency;
float maxFrequency;
float noteOffset;
PFont font;
int count;
int radius = 25;

void setup()
{
  size(512, 480);
  frameRate(60);
  height3 = height/3;
  rectMode(CORNERS);
  smooth();
  font = loadFont("SegoeUI-12.vlw");
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1024, 2048);
  bpf = new BandPass(centerFrequency, 100, in.sampleRate());
  in.addEffect(bpf);
  bd = new BeatDetect();
  // create an FFT object that has a time-domain buffer the same size as input's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fftLin = new FFT( in.bufferSize(), in.sampleRate() );

  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLin.linAverages( 30 );
  count=0;
}



void draw()
{
  radius = 25;
  background(0);
  textFont(font);
  textSize( 18 );
  noFill();
  ellipse(width-30, 30, 50, 50);
  fill(255, 128);

  if (count>10) {
    bd.detect(in.mix);
    if ( bd.isOnset() ) radius = 50;
    ellipse(width-30, 30, radius, radius);
    in.removeEffect(bpf);
    centerFrequency = findCenterFreq();
    bpf = new BandPass(centerFrequency, 100, in.sampleRate());
    in.addEffect(bpf);
    maxFrequency = findMaxFreq();
    noteOffset = calculateOffset();
    drawIndications();
    drawFullSpectrum();
    fftLin.forward( in.mix );
  } 
  else {
    count++;
  }
}


float findCenterFreq() {
  float maxFreqAmp = -Float.MAX_VALUE;
  float maxFreq = 0;
  for (int i=0;i<notes.length;i++) {
    if (fftLin.getFreq(notes[i].freq)>=maxFreqAmp) {
      maxFreq=notes[i].freq;
      maxFreqAmp=fftLin.getFreq(notes[i].freq);
    }
  }
  return maxFreq;
}

float findMaxFreq() {
  float maxFreqAmp = -Float.MAX_VALUE;
  float maxFreq = 0;
  for (float i=0;i<in.sampleRate()/2;i+=0.01) {
    if (fftLin.getFreq(i)>=maxFreqAmp) {
      maxFreq=i;
      maxFreqAmp = fftLin.getFreq(i);
    }
  }
  return maxFreq;
}

float calculateOffset() {
  return round(centerFrequency-maxFrequency);
}

void drawIndications() {
  String centerFreqName = "";
  for (int i=0;i<notes.length;i++) {
    if (centerFrequency==notes[i].freq) {
      centerFreqName = notes[i].name;
    }
  }

  String maxFreqName = "";
  for (int i=0;i<notes.length;i++) {
    if (round(maxFrequency)==round(notes[i].freq)) {
      maxFreqName = notes[i].name;
    }
  }
  String line1 = "Listening at " + maxFreqName + " (" + maxFrequency + ")";
  String line2 = "is " + noteOffset + "Hz offset from " + centerFreqName + " (" + centerFrequency + ")";
  text(line1, 5, 55);
  text(line2, textWidth(line1)-5, 80);
}


void drawFullSpectrum() {
  noFill();
  for (int i = 0; i < fftLin.specSize(); i++)
  {
    if ( i == fftLin.freqToIndex(centerFrequency) )
    {
      stroke(255, 0, 0);
    }
    else if (i==fftLin.freqToIndex(maxFrequency))
    {
      stroke(0, 0, 255);
    } 
    else if (noteOffset==0) 
    {
      stroke(0, 255, 0);
    }
    else
    {
      stroke(255);
    }
    line(i, height, i, height - fftLin.getBand(i)*spectrumScale);
  }
}

class Note {
  String name;
  float freq;
  public Note(String name, float freq) {
    this.name = name;
    this.freq = freq;
  }
}



