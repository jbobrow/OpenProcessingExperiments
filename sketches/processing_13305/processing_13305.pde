
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

void setup()
{
  size(700, 400, P2D);
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(20, 10, out.sampleRate());
  sine.portamento(20);
  out.addSignal(sine);
}

void draw()
{
  background(160);
  stroke(0,0,59,40);
  for(int i = 5; i < out.bufferSize() - 5; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 20, width);
    float x2 = map(i+1, 0, out.bufferSize(), 20, width);
    line(x1, 200 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 1000 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }
}

void mouseMoved()
{
 
  float freq = map(mouseY, 0, height, 50, 60);
  sine.setFreq(freq);
  float pan = map(mouseX, 0, width, -1, 1);
  sine.setPan(pan);
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}


