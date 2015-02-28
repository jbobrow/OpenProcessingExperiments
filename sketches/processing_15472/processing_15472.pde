
import ddf.minim.*;
import ddf.minim.signals.*;

Minim min;
AudioOutput play;
SineWave sine;

void setup()
{
  size(300,300);
  min = new Minim(this);
  play = min.getLineOut(Minim.STEREO);
  sine = new SineWave(261.63, .5, play.sampleRate());
  play.addSignal(sine);
}


void draw()
{
  fill(0);
  rect(0, 0, 300, 37.5);
  fill(20);
  rect(0, 37.5, 300, 37.5);
  fill(40);
  rect(0, 75, 300, 37.5);
  fill(60);
  rect(0, 112.5, 300, 37.5);
  fill(80);
  rect(0, 150, 300, 37.5);
  fill(100);
  rect(0, 187.5, 300, 37.5);
  fill(120);
  rect(0, 225, 300, 37.5);
  fill(140);
  rect(0, 262.5, 300, 37.5);
  if (mousePressed == true)
  {
    if (mouseY <= 37.5)
    {
      sine.setFreq(261.63);
    }
    else if (mouseY <=75)
    {
      sine.setFreq(293.66);
    }
    else if (mouseY <=112.5)
    {
      sine.setFreq(329.63);
    }  
    else if (mouseY <=150)
    {
      sine.setFreq(349.23);
    }
    else if (mouseY <=187.5)
    {
      sine.setFreq(392.00);
    }
    else if (mouseY <=225)
    {
      sine.setFreq(440.00);
    }
    else if (mouseY <=262.5)
    {
      sine.setFreq(493.88);
    }
    else if (mouseY <=300)
    {
      sine.setFreq(523.25);
    }
  }
}

