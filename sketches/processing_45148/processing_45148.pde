
import ddf.minim.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
NotchFilter notch;
    float freq;
    float band;


void setup()
{
  size(300, 200, P3D);
 
  minim = new Minim(this);
  song = minim.loadFile("groove.mp3");
  song.play();
  song.loop();
  
  notch = new NotchFilter(440, 20, song.sampleRate());
  song.addEffect(notch);
}

void mouseMoved()
{
  freq = map(mouseX, 0, width, 100, 2000);
  band = map(mouseY, 0, height, 50, 500);
  notch.setFreq(freq);
  notch.setBandWidth(band);
}

void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  song.close();
  minim.stop();
  super.stop();
}

