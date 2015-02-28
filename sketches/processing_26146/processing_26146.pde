
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

public static String piString = "31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679";
public static float[] freqs = {261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25, 587.33, 659.26};

Minim minim;
AudioOutput out;
SineWave sine;

PImage b;


int counter = 0;

void setup() {
  size (200, 200, P2D);
  frameRate(30);
  minim = new Minim(this);
  out = minim.getLineOut (Minim.STEREO);
  
  sine = new SineWave(freqs[(int) piString.charAt (counter) - 49], 0.5, out.sampleRate());   
  sine.portamento(200);
  out.addSignal(sine);
  
  b = loadImage("note.png");

}

void draw () {
  background (255);
  
  if (frameCount % 10 == 0) {
    counter ++;
    if (counter >= 32) counter = 0;
    sine.setFreq(freqs[(int) piString.charAt (counter) - 49]);
  }
  
  image (b, 0, 0, width, height);
  
  fill (0, 0, 0, 128);
  noStroke ();
  
  rect (0, height, width, -map ((int) piString.charAt (counter) - 49, 0, 9, 0, height));
}

void stop()
{
  out.close();
  minim.stop();
 
  super.stop();
}

void keyReleased () {
  save("slide.png"); 
}

