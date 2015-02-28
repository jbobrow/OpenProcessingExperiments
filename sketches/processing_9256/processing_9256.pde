
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioOutput out;
SquareWave square;
LowPassSP   lowpass;
 
void setup()
{
  size(512, 200);
 
  minim = new Minim(this);
 
  // get a stereo line out with a sample buffer of 512 samples
  out = minim.getLineOut(Minim.STEREO, 512);
 
  // create a SquareWave with a frequency of 440 Hz, 
  // an amplitude of 1 and the same sample rate as out
  square = new SquareWave(440, 1, 44100);
 
  // create a LowPassSP filter with a cutoff frequency of 200 Hz 
  // that expects audio with the same sample rate as out
  lowpass = new LowPassSP(200, 44100);
 
  // now we can attach the square wave and the filter to our output
  out.addSignal(square);
  out.addEffect(lowpass);
}
 
void draw()
{
  // you might decide to draw the waveform here or do something else
}
 
// here we provide a way to mute out
// because, let's face it, it's not a very pleasant sound
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( out.isMuted() )
    {
      out.unmute();
    }
    else
    {
      out.mute();
    }
  }
}
 
void stop()
{
  out.close();
  minim.stop();
 
  super.stop();
}

