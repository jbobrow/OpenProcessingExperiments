
import ddf.minim.*;//docs http://code.compartmental.net/minim/javadoc/
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

SineWave[] notes;
int[] score;
Minim minim;
int playCount = 0;
AudioOutput out;


void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);

  notes = escalaGenericaRegular((int)random(4,48), 55, (int)random(2,6));

  score = new int[100];

  for (int k = 0; k< score.length; k++) {
    score[k] = (int)random(0, notes.length);
  }


  size(800, 150);
}

void draw() {

  float period = 5; 
  float x = sin(frameCount) + cos(TWO_PI * frameCount / period);

  if (x > 1.5) {
    out.clearSignals();
    if (playCount==score.length) {
      playCount=0;
    }
    playNote(score[playCount]);
    playCount++;
  }

  background(0);
  stroke(255);
  // draw the waveforms
  for (int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 75 + out.left.get(i)*50, x2, 75 + out.left.get(i+1)*50);
  }
}



SineWave[] escalaGenericaRegular(int d, float f, int n) {
  SineWave[] notes;
  float v = (float)d;
  notes = new SineWave[d*n];
  for (int a=0; a< n; a++) {
    for (int b=0; b< d; b++) {
      notes[b+d*a] = new SineWave(pow(2, a)*(f *pow( pow(2, (1/v)), b)), 1, 44100);
    }
  }
  return notes;
}


void playNote(int n) {
  if (n <notes.length) {
    out.addSignal(notes[n]);
  }
}


void stopNote(int n, int t) {
  out.addSignal(notes[playCount]);
}



