

import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer mysound;
FFT fft;

 
void setup()
{
  size(600, 300, P3D);
  textMode(SCREEN);
  background(150);
  minim = new Minim(this);
 
  mysound = minim.loadFile("Madonna - Beat Goes On.mp3", 512);
  mysound.loop();
  fft = new FFT(mysound.bufferSize(), mysound.sampleRate()); 

}
 
void draw()
{
   colorMode(HSB, 100);
   noStroke();
   fft.forward(mysound.mix);
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    ellipse(height/width, i/width, height + fft.getBand(i), height + fft.getBand(i));
   translate(300,150);
   ellipse(height/width, i/width, height + fft.getBand(i), height + fft.getBand(i));
  
  }
  fill(random(255),random(255),random(255),20);

}
 

void stop()
{
 
  mysound.close();
  minim.stop();
 
  super.stop();
}



