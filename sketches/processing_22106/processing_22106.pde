

 
import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer mysound;
FFT fft;

 
void setup()
{
  size(250, 600, P3D);
  textMode(SCREEN);
 
  minim = new Minim(this);
 
  mysound = minim.loadFile("Excuses.mp3", 2048);
  mysound.loop();
 
  fft = new FFT(mysound.bufferSize(), mysound.sampleRate());
 
 
}
 
void draw()
{
  background(0);
  stroke(#062B39);
  
  fft.forward(mysound.mix);
  
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i
    ellipse(i, 300, i, 100 - fft.getBand(i)*4);
  }
  fill(0,107,144,70);
  
  
  float currGain = map(mouseY, 0, 600, 12, -40);      // map value to mouse 
  println(currGain);
  mysound.setGain(currGain);

}
 

void stop()
{
  // close Minim audio classes
  mysound.close();
  minim.stop();
 
  super.stop();
}

