
/**
Based on: 
 * Forward FFT
 * by Damien Di Fede. 
Click to play. 

 */

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;
String windowName;
PFont fontA;



void setup()
{
  size(800, 800);
  minim = new Minim(this);
  
  jingle = minim.loadFile("seeing ear dog.mp3", 2048);

  fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
   fft.window(FFT.HAMMING);
   
   
}

void draw()
{ 
  
 
 
fill(255);
 
 
  fill(1,5);
  rect(0,0,width,height);
  
  smooth();

  fft.forward(jingle.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    strokeWeight(fft.getBand(i)*2);
   stroke(i/1.2,i/1.2,255);
   point(i*2,fft.getBand(i)*200);
    
   
   point(fft.getBand(i)*200,i*2);
   
   
   point((width -fft.getBand(i)*200),(height - i*2));
   
   
   point((width -i*2),(height - fft.getBand(i)*200));
    
  
  
  

  }
    
}

 
 void mouseReleased()
 {

 jingle.play();

 }
 
 
void stop()
{
  // always close Minim audio classes when you finish with them
  jingle.close();
  minim.stop();
  
  super.stop();
}

