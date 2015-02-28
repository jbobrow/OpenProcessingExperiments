
/**
 * Pixel Array. 
 * 
 * Click and drag the mouse up and down to control the signal and 
 * press and hold any key to see the current pixel being read. 
 * This program sequentially reads the color of every pixel of an image
 * and displays this color to fill the window.  
 */
 
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
PImage a;
int[] aPixels;
int direction = 1;
boolean onetime = true;
float signal;

void setup() 
{
  size(640, 495);
  aPixels = new int[width*height];
  noFill();
  stroke(255);
  frameRate(50);
  a = loadImage("Cumple Feliz.jpg");
  for(int i=0; i<width*height; i++) {
    aPixels[i] = a.pixels[i];
  }
  
  
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(10);
  // add the oscillator to the line out
  out.addSignal(sine);
}

void draw() 
{
  if (signal > width*height-1 || 
      signal < 0) { 
    direction = direction * -1; 
  }

  if(mousePressed) {
    if(mouseY > height-1) { 
      mouseY = height-1; 
    }
    if(mouseY < 0) { 
      mouseY = 0; 
    }
    signal = mouseY*width+mouseX;
  } else {
    signal += (0.33*direction);  
  }
  
  
    loadPixels();
    for (int i=0; i<width*height; i++) { 
      pixels[i] = aPixels[i];  
    }
    updatePixels();
    rect(signal%width-5, int(signal/width)-5, 10, 10);
    point(signal%width, int(signal/width));
   
  // with portamento on the frequency will change smoothly
  float freq = map(brightness(aPixels[int(signal)]), 0, 255, 987.77, 261.63);
  //aPixels[int(signal)];
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(pixels[int(signal)], 0, width, -1, 1);
  sine.setPan(pan);
  
  print ("\n Brillo= " + brightness (aPixels[int(signal)]) + "   hue= " + hue (aPixels[int(signal)]) + "  Freq= " + freq);
}






