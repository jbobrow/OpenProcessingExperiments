
/**
Add Listener code originally created by Damien Di Fede.
*/

import ddf.minim.*;

Minim minim;
AudioPlayer groove;
WaveformRenderer waveform;

 
void setup()
{
  fill(204, 102, 0);
  size(512, 200, P2D);

  minim = new Minim(this);
  
  groove = minim.loadFile("rave.wav", 512);
  groove.loop();
  waveform = new WaveformRenderer();
  groove.addListener(waveform);
  
  
}

void draw()
{
  
  background(random(255), random(255), random(255));
  fill(204, 102, 0);
  // see waveform.pde for an explanation of how this works
  waveform.draw();

}



