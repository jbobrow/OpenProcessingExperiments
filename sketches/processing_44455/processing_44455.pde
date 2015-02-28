
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

color col;

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

void setup() {
  size(600, 300);

  minim = new Minim(this);

  song = minim.loadFile("shempi.aif", 2048);
  song.play();

  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300);
  kickSize = snareSize = hatSize = 16;
  bl = new BeatListener(beat, song);
}

void draw() {
  background(0);
  smooth();
  noStroke();
  fill(1, 9, 62, 100);
  if ( beat.isKick() ) kickSize = 100;
  if ( beat.isSnare() ) snareSize = 100;
  if ( beat.isHat() ) hatSize = 100;
  ellipseMode(CORNER);
  ellipse(-50, -50, kickSize*12, kickSize*10);
  fill(234,121,0, 300);
  for (int i=2; i<200; i+=10) {
    rect(300, 0, i, snareSize*4);
  }
  fill(col);
  col = color(hatSize, 100);
  rect(0, 0, width, height);
  kickSize = constrain(kickSize * 0.95, 20, 200);
  snareSize = constrain(snareSize * 0.95, 1, 200);
  hatSize = constrain(hatSize * 0.95, 16, 100);
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}


