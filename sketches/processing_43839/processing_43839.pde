
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
BeatDetect beat;

float eRadius;

void setup()
{
  size(600, 300);

  minim = new Minim(this);

  song = minim.loadFile("lm.aif", 512);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  beat = new BeatDetect();
  
  ellipseMode(CENTER_RADIUS);
  eRadius = 20;
}

void draw()
{
  background(21, 15, 245);
  fft.forward(song.mix);

  stroke(255, 0, 0, 128);
  strokeWeight(1);
  for (int i = 0; i < fft.specSize(); i++)
  {
    line(i, height, 600, height - fft.getBand(i)*4);
  }

  stroke(165, 0, 0);
  strokeWeight(1);
  for (int i = 0; i < song.left.size() - 1; i++)
  {
    line(i+400, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i+400, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
  
  stroke(255, 0, 0, 128);
    strokeWeight(2);
  for (int i = 0; i < fft.specSize(); i++)
  {
    line(i, height, i, height - fft.getBand(i)*4);
  }
  
  beat.detect(song.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  fill(60, 255, 0, a);
  noStroke();
  if ( beat.isOnset() ) eRadius = 80;
  ellipse(width/2, height/2, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;
}

void stop()
{
  song.close();
  minim.stop();

  super.stop();
}


