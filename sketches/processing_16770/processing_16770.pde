
/**
 * Binaural Sine Waves with minim by Roger Löf
 * Two sine waves between 60 and 1500 Hz on separate stereo channels
 * with 0-30 Hz difference in frequency create so-called 'binaural beats'
 * Listen with stereo headphones.
 *
 * Essentially just a slight modificiation of
 * Sine Wave Signal by Damien Di Fede.
 * (SineWaveSignal example under minim library in processing)
*/
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine1;
SineWave sine2;

void setup()
{
  size(512, 300, P2D);
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine1 = new SineWave(440, 0.5, out.sampleRate());
  sine2 = new SineWave(440, 0.5, out.sampleRate());
  sine1.portamento(200);
  sine2.portamento(200);
  out.addSignal(sine1);
  out.addSignal(sine2);
}

void draw()
{
  background(0);
  stroke(255);
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
    line(x1, 250 + (out.left.get(i)+out.right.get(i))*25, x2, 250 + (out.left.get(i)+out.right.get(i))*25);
  }
}

void mouseMoved()
{
  float freq1 = map(mouseY, 0, height, 1500, 60);
  float freq2 = freq1 + mouseX * 30 / width;
  sine1.setFreq(freq1);
  sine2.setFreq(freq2);
  float pan1 = -1;
  float pan2 = 1;
  sine1.setPan(pan1);
  sine2.setPan(pan2);
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

