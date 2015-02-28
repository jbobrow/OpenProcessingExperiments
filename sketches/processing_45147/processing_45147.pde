
import ddf.minim.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
HighPassSP highpass;
float freq;

void setup()
{
  size(300, 200, P3D);
 
  minim = new Minim(this);
  song = minim.loadFile("groove.mp3");
  song.play();
  song.loop();
    
  highpass = new HighPassSP(1000, song.sampleRate());
  song.addEffect(highpass);

}

void draw()
{

} 

void mouseMoved()
{
  freq = map(mouseX, 0, width, 1000, 14000);
  highpass.setFreq(freq);
}

void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  song.close();
  minim.stop();
  super.stop();
}

