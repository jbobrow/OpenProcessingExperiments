
//linear_audiogram_tubular by Lisa B. Woods
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/30335*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;

BeatDetect beat;

int a = 1;
int h = 200;
float x;
float dim = 80.0;

void setup() {
  background(0);
  smooth();
  size(1200, 600);

  minim = new Minim(this);

  song = minim.loadFile("chords steel drum.mp3", 512);
  song.loop();

  fft = new FFT(song.bufferSize(), song.sampleRate());
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
}


void draw() {

  x = x + 3;
  if (x > width + dim) {
    x = -dim;
    h = h + 300;
  } 

  fft.forward(song.mix);
  strokeWeight(1.5);
  stroke(255);

  translate(x, h/2-dim/2);

  for (int i = 0; i < song.left.size() - 1; i++)
  {
    rotate(PI/song.left.size());
    line(0, 50 + song.left.get(i)*200, 0, 50 + song.left.get(i)*200);
  }

  minim.stop();
}



