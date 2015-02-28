
import ddf.minim.*;
import ddf.minim.signals.*;

/*This the class definition for AudioMonitor which I wrote
in an attempt to have an object that could simultaneously
recieve data from an AudioInput object and feed data to an
AudioOuput object. In the process I created something that
I believe can also be used by classes that implement
Polyphonic and AudioSynthesizer, as well as the SignalChain
object. Realisticly, I have not tested those possibilities
so maybe I'm dreaming and this class needs a lot more work.
Be my guest...
The sample rate of AudioInput and AudioOutput must be the
same or you'll get some funny business. I tried to give
AudioMonitor the ability to use an Output buffer that is
1x, 2x, or 4x the size of the Input buffer, but I'm not
a hardcore coder so maybe that's a bad idea or just not
the best execution.*/

public class AudioMonitor
extends java.lang.Object
implements AudioSignal
{
  //reference to the AudioInput given in construction
  private AudioInput ainput;
  //Left and Right audio buffers. Mono is just Left buffer.
  private float[] buffL;
  private float[] buffR;
  private int inputBuffSize;
  private int outputBuffSize;
  //reference allows AudioSource or subclass to addListener
  private AudioListener listener;
  private boolean listening = false;
  
  //this constructor requires an AudioInput argument
  public AudioMonitor(AudioInput ain) {
    ainput = ain;
    inputBuffSize = ainput.left.size();
    outputBuffSize = inputBuffSize;
    if(ainput.type() == Minim.MONO) {
      buffL = new float[inputBuffSize];
    } else {
      buffL = new float[inputBuffSize];
      buffR = new float[inputBuffSize];
    }
    listener = null;
  }
  
  //this is adopted from Oscillator class. 
  //Maybe not important.
  protected float value(float step) {
    if(buffL != null) {
      int i = (int) (buffL.length * (step/(2*PI)));
      return buffL[i];
    } else return 0;
  }
  
  //this is the very important generate() function which 
  //makes this class usable as an AudioSignal
  public final void generate(float[] signal) {
    outputBuffSize = signal.length;
    
    //how to handle differing sizes between In/Out buffers
    if(outputBuffSize < inputBuffSize) {
      buffL = ainput.left.toArray();
      for(int i=0; i < outputBuffSize; i++) {
        signal[i] = buffL[i];
      }
      if( listener != null ) {
        listener.samples(signal);
        listening = true;
      } else listening = false;
      
    } else if(outputBuffSize >= inputBuffSize) {
      buffL = ainput.left.toArray();
      for(int i=0; i < inputBuffSize; i++) {
        signal[i] = buffL[i];
      }
      if( listener != null ) {
        listener.samples(signal);
        listening = true;
      } else listening = false;
      
      if(outputBuffSize >= 2*inputBuffSize) {
        buffL = ainput.left.toArray();
        for(int i=0; i < inputBuffSize; i++) {
          signal[i+inputBuffSize] = buffL[i];
        }
        if( listener != null ) {
          listener.samples(signal);
          listening = true;
        } else listening = false;
      }
      
      if(outputBuffSize >= 4*inputBuffSize) {
        buffL = ainput.left.toArray();
        for(int i=0;i < inputBuffSize; i++) {
          signal[i+2*inputBuffSize] = buffL[i];
        }
        if( listener != null ) {
          listener.samples(signal);
          listening = true;
        } else listening = false;
        
        buffL = ainput.left.toArray();
        for(int i=0;i < inputBuffSize; i++) {
          signal[i+3*inputBuffSize] = buffL[i];
        }
        if( listener != null ) {
          listener.samples(signal);
          listening = true;
        } else listening = false;
      }
      
    }
    
  }
  
  //stereo version of generate()
  public final void generate(float[] left, float[] right) {
    outputBuffSize = left.length;
    
    //how to handle differing sizes between In/Out buffers
    if(outputBuffSize < inputBuffSize) {
      buffL = ainput.left.toArray();
      buffR = ainput.right.toArray();
      for(int i=0; i < outputBuffSize; i++) {
        left[i] = buffL[i];
        right[i] = buffR[i];
      }
      if( listener != null ) {
        listener.samples(left,right);
        listening = true;
      } else listening = false;
      
    } else if(outputBuffSize >= inputBuffSize) {
      buffL = ainput.left.toArray();
      buffR = ainput.right.toArray();
      for(int i=0; i < inputBuffSize; i++) {
        left[i] = buffL[i];
        right[i] = buffR[i];
      }
      if( listener != null ) {
        listener.samples(left,right);
        listening = true;
      } else listening = false;
      
      if(outputBuffSize >= 2*inputBuffSize) {
        buffL = ainput.left.toArray();
        buffR = ainput.right.toArray();
        for(int i=0; i < inputBuffSize; i++) {
          left[i+inputBuffSize] = buffL[i];
          right[i+inputBuffSize] = buffR[i];
        }
        if( listener != null ) {
          listener.samples(left,right);
          listening = true;
        } else listening = false;
      }
      
      if(outputBuffSize >= 4*inputBuffSize) {
        buffL = ainput.left.toArray();
        buffR = ainput.right.toArray();
        for(int i=0;i < inputBuffSize; i++) {
          left[i+2*inputBuffSize] = buffL[i];
          right[i+2*inputBuffSize] = buffR[i];
        }
        if( listener != null ) {
          listener.samples(left,right);
          listening = true;
        } else listening = false;
        
        buffL = ainput.left.toArray();
        buffR = ainput.right.toArray();
        for(int i=0;i < inputBuffSize; i++) {
          left[i+3*inputBuffSize] = buffL[i];
          right[i+3*inputBuffSize] = buffR[i];
        }
        if( listener != null ) {
          listener.samples(left,right);
          listening = true;
        } else listening = false;
      }
      
    }
    
  }
  
  //allows for addListener to be used
  public final void setAudioListener(AudioListener al) {
    listener = al;
  }
  
  //query the size of the buffer
  public int buffSize() {
    if(buffL.length > 0) {
      return buffL.length;
    } else return 0;
  }
  
  //query the value of sample 'i' of Left or Mono
  public float getSampleL(int i) {
    if( i < buffL.length ) {
      return buffL[i];
    } else return 0;
  }
  
  //query the value of sample 'i' for Right
  public float getSampleR(int i) {
    if( i < buffR.length ) {
      return buffR[i];
    } else return 0;
  }
  
  //ask if listener is active
  boolean isHeard() {
    return listening;
  }
  
  public void close() {
    ainput.close();
  }
}

