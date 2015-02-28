
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioOutput sound;    // create an output object
SineWave sine;      // create an sine wave object

int freq = 500;
float amp = 0.25;
int samples = 44000;


void setup(){
  size(300,300);
  colorMode(HSB,100);
  
  minim = new Minim(this);
  sound = minim.getLineOut(Minim.STEREO, 512);
  
  // start the sine wave with this default tone
  sine = new SineWave(freq, amp, samples);
  
  // add the wave to the output object so we can hear it
  sound.addSignal(sine);                              

  // mute the sound by default 
  sound.mute();
}



void draw(){
  
  background(0);
  color col = get(mouseX, mouseY);
  
  float freq = map(int(floor(brightness(col))), 0, 300, 10, 1000);
  sine.setFreq(freq);
  float amp = map(int(floor(hue(col))), 0, 300, .1, 2);
  sine.setAmp(amp);
}
  
  
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( sound.isMuted() )
    {
      sound.unmute();
    }
    else
    {
      sound.mute();
    }
  }
}

void stop()
{
  sound.close();
  minim.stop();

  super.stop();
}


