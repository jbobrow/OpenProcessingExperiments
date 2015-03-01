
//Take an image, scan column by row, Translate RGB to Frequency, Amplitude, and Balance respectively. output and save an mp3. Each pixel takes .25 seconds long.
//Take an mp3, listen for .25 seconds. Translate back into RGB using the same parameters and output a pixel. Move over. Repeat.
import ddf.minim.*;
import ddf.minim.ugens.*;


Minim minim;
AudioOutput out;

PImage img;
int locX = 0;
int locY = 0;

void setup() {
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 2048);
  out.setTempo(60);


  background(0);
  img = loadImage("random.jpg");
  size(500,500);
  img.loadPixels();
  image(img, 0, 0);
  for (int locY = 0; locY < height; locY+=5) {
    for (int locX = 0; locX < width; locX+=5) {
      out.pauseNotes();

      int loc = locX + locY*width;
      color current = img.pixels[loc];
      float colorR = red(current);
      float colorG = green(current);
      float colorB = blue(current);

      float frequency = map(colorR, 0, 255, 220, 440);
      float amplitude = map(colorG, 0, 255, 0, 1);
      float balance = map(colorB, 0, 255, -1, 1);     

      out.playNote(loc*0.05, 0.25, new ToneInstrument (frequency, amplitude, Waves.SINE, out));


      out.resumeNotes();
      
      delay(1);

      //I have a playNote() that takes the parameters ( start time, duration,
      //instrument(note, volume, wave, output)
    }
  }
}

class ToneInstrument implements Instrument
{
  // create all variables that must be used throughout the class
  Oscil toneOsc;
  ADSR adsr;
  AudioOutput out;
  
  // constructors for this intsrument
  ToneInstrument( float note, float amplitude, Waveform wave, AudioOutput output )
  {
    // equate class variables to constructor variables as necessary
    out = output;
    
    // make any calculations necessary for the new UGen objects
    // this turns a note name into a frequency
    float frequency = note;
    
    // create new instances of any UGen objects as necessary
    toneOsc = new Oscil( frequency, amplitude, wave );
    adsr = new ADSR( 1.0, 0.04, 0.01, 1.0, 0.1 );
 
    // patch everything together up to the final output
    toneOsc.patch( adsr );
  }
  
  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    // turn on the adsr
    adsr.noteOn();
    // patch the adsr into the output
    adsr.patch( out );
  }
  
  void noteOff()
  {
    // turn off the note in the adsr
    adsr.noteOff();
    // but don't unpatch until the release is through
    adsr.unpatchAfterRelease( out );
  }
}


