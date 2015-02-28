
// TONNETZ CHORD SYNTH
// by Steven Kay, 2009
// version 2 
// - fixed the implementation of chord changes :)
//
// This is a chord keyboard capable of playing a single 3-note chord at a time
// The keyboard is a grid representing a tonnetz (tone network)
// the y axis represents perfect thirds, so each cell is a perfect third about the cell beneath
// the x axis is the 'cycle of fifths' (going to the right) or cycle of fourths (going to the left)
// 
// Click on a square to play the chord with that note name as the keynote
// A Left-click to play a major chord
// A Right-click to play a minor chord
//
// Because of the nature of the tone network, 'nice' progressions generally involve moving
// from one square to a neighbouring square, either horizontally (cycle of 4ths/5ths) or
// vertically (up or down a third), maybe changing from Major to Minor or vice-versa.
//


import ddf.minim.*;
import ddf.minim.signals.*;

// audio outputs for 3 notes

AudioOutput out1;
AudioOutput out2;
AudioOutput out3;
AudioOutput out4;


SineWave line1,line2,line3,line4;

// names of notes (UK notation)

String[] names={
  "C","C#","D","D#","E","F","F#","G","G#","A","A#","B",
  "C","C#","D","D#","E","F","F#","G","G#","A","A#","B"
};

// note frequencies, in Hz. C is 'middle C'

float[] notes={
  261.63f, //C
  277.18f,
  293.66f, //D
  311.13f,
  329.63f, //E
  349.23f, //F
  369.99f,
  392.0f, //G
  415.3f,
  440.0f, //A
  466.16f,
  493.88f, //B
  523.25f,
  554.37f,
  587.33f,
  622.25f,
  659.26f,
  698.46f,
  739.99f,
  783.99f,
  830.61f,
  880.00f,
  932.33f,
  987.77f
};

// chord types
int MAJOR=0;
int MINOR=1;

Minim minim ;
PFont font;
PImage logo;

// notes being played 0..1 eg. C major will be 0,4,7

int note1=0;
int note2=4;
int note3=7;
int note4=0;

// mod defines number of octaves
// set to 12 or 24 for 1 or 2 octaves
// if 12, all notes fall in one octave but some chords will be inverted
// if 24, no chords will be inverted but may have large jumps between some chords

int mod=12;

void setup()
{

  size(512, 512);
  
  font=loadFont("ArialNarrow-48.vlw");
  textFont(font, 14); 
  logo=loadImage("logo.png");
  minim = new Minim(this);

  // get a line out from Minim,  
  // default sample rate is 44100, default bit depth is 16
  out1 = minim.getLineOut(Minim.STEREO, 1024);
  out2 = minim.getLineOut(Minim.STEREO, 1024);
  out3 = minim.getLineOut(Minim.STEREO, 1024);
  out4 = minim.getLineOut(Minim.STEREO, 1024);

  // create a sine wave Oscillator,  
  // start with c major
  line1 = new SineWave(261.63, 0.25, out1.sampleRate());
  line2 = new SineWave(329.63, 0.25, out2.sampleRate());
  line3 = new SineWave(392.00, 0.25, out3.sampleRate());
  line4 = new SineWave(392.00, 0.25, out3.sampleRate());

  line1.portamento(100);
  line2.portamento(100);
  line3.portamento(100);
  line4.portamento(100);
  line4.setAmp(0);
  
  // add the oscillator to the line out
  out1.addSignal(line1);
  out2.addSignal(line2);
  out3.addSignal(line3);
  out4.addSignal(line4);
  
  
  //loop();
  draw();
}

long fc=0; // frame counter

void draw()
{
  background(0);
  fill(0);
  noStroke();
  rect(0,0,400,200);
  fc++;
  stroke(0,255,0,255);
  // draw the waveform
  // simply add the three waveforms together
  for(int i = 0; i < out1.left.size()-1; i++)
  {
    float amp1=100.0f+((out1.left.get(i))*50) + ((out2.left.get(i))*50) + ((out3.left.get(i))*50);
    float amp2=100.0f+((out1.left.get(i+1))*50) + ((out2.left.get(i+1))*50) + ((out3.left.get(i+1))*50);
    line((float)i,amp1,(float)(i+1),amp2);

  }
  
  // draw grid
  stroke(255);
  for (int r=0;r<6;r++) {
    for (int c=0;c<16;c++) {
      int row=6-r;
      int col=c;
      int tonickey=((7*col)+(4*row))%12;
      fill(99);
      if (tonickey==note1%mod) {
        fill(255,0,0,255);
      }
      if (tonickey==note2%12 || tonickey==note3%12) {
        fill(255,0,0,190);
      }        
      rect(c*32,200+(32*r),32,32);   
      fill(255);
      text(names[tonickey],(c*32)+10,(200+(32*r))+16);
    }
  }
  
  image(logo,0,392);
}

void changeChord(int keynumber,int type) {
  
  // change chord
  // keynumber is root (0=C,1=C#...11=B)
  // type is 0 (MAJOR) or 1(MINOR)
  //
  // note that currently restricted to one octave, so higher key notes like AMinor, B Major
  // will play as inverted chords. These may not sound as good as the 'usual' uninverted chords
  
  note1=keynumber;
  note2=keynumber;
  note3=keynumber;
  
  if (type==MAJOR) {
    note2=(keynumber+4) % mod;
    note3=(keynumber+7) % mod;    
  }
  if (type==MINOR) {
    note2=(keynumber+3) % mod;
    note3=(keynumber+7) % mod;    
  }
  
  line1.setFreq(notes[note1]);
  line2.setFreq(notes[note2]);
  line3.setFreq(notes[note3]);
  
  
}

void mouseClicked() {
  if (mouseY<200 || mouseY>392) return; // only click on grid!
  // change the tonic (key note) of chord depending on which square you clicked
  int row=6-((mouseY-200)/32);
  int col=(mouseX/32);
  int tonickey=((7*col)+(4*row))%12;
  int type=(mouseButton == LEFT) ? MAJOR : MINOR; // left click for major, right click for minor
  changeChord(tonickey,type);  
}

void stop()
{
  // always close Minim audio classes when you are done with them
  out1.close();
  out2.close();
  out3.close();
  super.stop();
}


