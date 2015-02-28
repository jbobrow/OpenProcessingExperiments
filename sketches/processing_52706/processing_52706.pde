
/*
This class encapsulates the signal of a single sine wave and exposes it to minim through the AudioSignal interface
*/
public class CustomWave implements AudioSignal
{
  private float _xLocation; //The current position the sound from left to right (-1 = Left, 1 = Right)
  private float _desiredX; //The target sound sound location to move towards
  private double _offset; //Track how many samples remain uncalcualted in period to allow for phase corrections between refreshes
  private boolean _effectAmplitude = true; //Does the sound position influence the amplitude of the channels?
  private boolean _effectDelay = true; //Does the sound position influence the delay of one channel?
  
  private int _sampsMs; //The number of samples per milisecond of sound
  private float _frequency; //Declare frequency of this wave
  
  private float _maxDelay; //Declare maximum allowed delay
  private float _addDelay; //Decalare any additional delay
  private float harmonicIndex; //Declare harmonic index
  
  private float _maxAmp; //Declare Maximum allowed amplitude
  private float _leftAmpMultiplier = 1; //Multiplier for the left sound channel amplitude
  private float _rightAmpMultiplier = 1; //Multiplier for the right sound channel amplitude
  
  private float _leftDelay; //The current delay applied to the left channel
  private float _rightDelay; //The current dealy applied to the right channel
  private float _leftAmplitude; //The current amplitude of the left channel
  private float _rightAmplitude; //The current amplitude of the right channel
  
  float _tmpXLoc; //A temporary holder for the current X location used to reset the location after processing each channel.  Declared as an instance varaible to prevent redeclaration on each cycle;
  
  double[] leftSig = new double[_bufferSize]; //Holder for the signal information for the left channel
  double[] rightSig = new double[_bufferSize]; //Holder for teh signal information for the right channel
  
  private boolean _isActive;
  
  //Constructor for a custom wave object
  //Parameters:
  //xPos: Initial position of sound on X axis (-1 <= xPos <= 1)
  //freq: Frequency of the sine wave
  //harmonic: The harmonic index of this wave relative the base frequency
  public CustomWave(float xPos, float freq, float harmonic)
  {
    setXLocation(xPos); //Set the current x position of the sound source
    setXPosition(0); //Set the desired xposition
    setHarmonicIndex(harmonic); //Set the current harmonic index 
    setEffectAmplitude(false);
    setEffectAmplitude(false);
    _offset = 0; //There will be no offset when first creating a wave as no buffer cycles have been run
    _sampsMs = _sampRate / 1000; //Calculate the number of samples per millisecond
    _maxDelay = 3; //Set the maximum delay in milliseconds
    
    //Set initial delay conditions
    _leftDelay = map(_xLocation, 1, -1, 0, _maxDelay); 
    _rightDelay = map(_xLocation, -1, 1, 0, _maxDelay) ;
  }
  
//*********************
//Encapsulating Methods
//*********************

  public void setFrequency(float freq)
  {
    _offset = 0;
    _frequency = freq;
  }
  
  public boolean getIsActive()
  {
    return _isActive;
  }
  public void setIsActive(boolean a)
  {
    _isActive = a;
  }
  
  //Accessor for the left hand signal data
  public double[] getLeftSignal()
  {
    return leftSig;
  }

  //Access for the right hand signal data
  public double[] getRightSignal()
  {
    return rightSig;
  }
  
  //Accessor and Mutator for Left Amplitude Multiplier
  public float getLeftAmpMultiplier()
  {
    return _leftAmpMultiplier;
  }
  public void setLeftAmpMultiplier(float m)
  {
    _leftAmpMultiplier = m;
    if (debug) println("LeftAmpMultiplier set: " + m);
  }
  
  //Accessor and Mutator for Left Amplitude Multiplier
  public float getRightAmpMultiplier()
  {
    return _rightAmpMultiplier;
  }
  public void setRightAmpMultiplier(float m)
  {
    _rightAmpMultiplier = m;
    if (debug) println("RightAmpMultiplier set: " + m);
  }
  
  //Accessor and mutator for Harmonic Index
  public float getHarmonicIndex()
  {
    return harmonicIndex;
  }
  public void setHarmonicIndex(float harmonic)
  {
    harmonicIndex = harmonic;
    if (debug) println("Harmonic index set: " + harmonic);
    _frequency = _baseFrequency * harmonicIndex;
    if (debug) println("Wave Frequency Calculated: " + _frequency);
  }
  
  //Accessor and Mutator for Effect Amplitude
  public boolean getEffectAmplitude()
  {
    return _effectAmplitude;
  }
  public void setEffectAmplitude(boolean t)
  {
    _effectAmplitude = t;
    if (debug) println("Affect Amplitude set: " + t);
  }
  
  //Accessor and Mutator for Effect Delay
  public boolean getEffectDelay()
  {
    return _effectDelay;
  }
  public void setEffectDelay(boolean t)
  {
    _effectDelay = t;
    if (debug) println("Affect Delay set: " + t);
  }
  
  //Mutator for target X Position
  public void setXPosition(float x)
  {
    _desiredX = x;
    if (debug) println("Target X Position set: " + x);
  }
  
  //Accessor and Private Mutator for actual X position
  public float getXLocation()
  {
    return _xLocation;
  }
  private void setXLocation(float x)
  {
    _xLocation = x;
    if (debug) println("Actual X location set: " + x);
  }
  
  //Accessor and Mutator for maximum amplitude
  private float getMaxAmp()
  {
    return _maxAmp;
  }
  public void setMaxAmp(float a)
  {
    _maxAmp = a;
    if (debug) println("Maximum Amplitude set: " + a);
  }
  
  //Mutator for maximum delay
  public void setMaxDel(float d)
  {
    _maxDelay = d;
    if (debug) println("Maximum Delay set: " + d);
  }
  
  //Mutator and Accessor for additional delay
  public float getAddDelay()
  {
    return _addDelay;
  }
  public void setAddDelay(float d)
  {
    _addDelay = d;
    if (debug) println("Additional Delay set: " + d);
  }
  
  //Accessor and private mutator for offset
  public double getOffset()
  {
    return _offset;
  }
  public void setOffset(double o)
  {
    _offset = o;
    if (debug) println("Phase offset set: " + 0);
  } 
//*************************
//END Encapsulating Methods
//*************************

//***************
//Private methods
//***************
  //Move the current x position of the sound source towards the desired location
  private void position()
  {
    if (getXLocation() < _desiredX )
      setXLocation(getXLocation() + 0.0004);
    
    if (getXLocation() >_desiredX  )
      setXLocation(getXLocation() - 0.0004);
  }
//*******************
//END Private methods
//*******************
  
//**************
//Public methods
//**************
  public float getCurrentAmplitude()
  {
    return max(getMaxAmp() * getLeftAmpMultiplier(), getMaxAmp() * getRightAmpMultiplier());
  }
//******************
//END Public methods
//******************  
  
//*****************************
//AudioSignal Interface members
//*****************************
  //Generate a mono signal
  public void generate(float[] signal)
  { 
    //Not implemented - Need a stereo signal
    throw new UnsupportedOperationException("This application requires a stereo signal");
  }
  
  public void generateLeft(float[] signal)
  {   
    //ToDo: Check this - only existsed on right channel previously!
    //float lastf = 0 + getOffset();
    
    //build signal
    for ( int i = 0; i < signal.length; i++ ) 
    {  
      if(getIsActive())
      {
        //Calculate left factor
        if (_effectAmplitude)
           _leftAmplitude = map(_xLocation, 1, -1, 0, _maxAmp);
         else
           _leftAmplitude = _maxAmp;
           
        if (_effectDelay && _xLocation < 0)
          _leftDelay = map(_xLocation, 1, -1, 0, _maxDelay); 
        
          if(i != 0 && _sampRate % i * _frequency == 0) position();
          signal[i] = (float)java.lang.Math.sin(((i + (_leftDelay + _addDelay) * _sampsMs) * _frequency * TWO_PI / _sampRate) + getOffset()) * _leftAmplitude * _leftAmpMultiplier ;
          
          //Do not include offset so a stationary wave is drawn
          leftSig[i] = java.lang.Math.sin(((i + (_leftDelay + _addDelay) * _sampsMs) * _frequency * TWO_PI / _sampRate)) * _leftAmplitude * _leftAmpMultiplier ;
          //leftSig[i] = sin((i * _sampsMs * _frequency * TWO_PI / _sampRate) + getOffset()) * _leftAmplitude * _leftAmpMultiplier ;
      }
      else
      {
        leftSig[i] = signal[i] = 0;
        if(i != 0 && _sampRate % i * _frequency == 0) position();
      }
    }
  }
  
  public void generateRight(float[] signal)
  { 
    //ToDo: Check this - only existsed on right channel previously!
    double lastf = 0 + getOffset();
    
    //build signal
    for ( int i = 0; i < signal.length; i++ ) 
    {
      if (getIsActive())
      {
        //Calculate right factor
        if (_effectAmplitude)
           _rightAmplitude = map(_xLocation, -1, 1, 0, _maxAmp);
         else
           _rightAmplitude = _maxAmp;
           
        if (_effectDelay && _xLocation >= 0)
          _rightDelay = map(_xLocation, -1, 1, 0, _maxDelay) ;
        
        if(i != 0 && _sampRate % i * _frequency == 0) position();
        
        signal[i] = (float)java.lang.Math.sin(((i + (_rightDelay + _addDelay)  * _sampsMs) * _frequency * TWO_PI / _sampRate) + getOffset()) * _rightAmplitude * _rightAmpMultiplier ;
        //rightSig[i] = signal[i];
        
        //Do not include offset so a stationary wave is drawn
        rightSig[i] =  java.lang.Math.sin(((i + (_rightDelay + _addDelay)  * _sampsMs) * _frequency * TWO_PI / _sampRate)) * _rightAmplitude * _rightAmpMultiplier ;
      }
      else
      {
        rightSig[i] = signal[i] = 0;
        if(i != 0 && _sampRate % i * _frequency == 0) position();
      }
    }
  }  
  //Generate a stereo signal
  public void generate(float[] left, float[] right)
  {
    //Process left and right signal separately
    _tmpXLoc = _xLocation;
    generateLeft(left);
    
    //Reset X location for generation of next channel data
    _xLocation = _tmpXLoc;
    generateRight(right);
    
    //Add a count of the missing samples to offset
    setOffset(getOffset() + _bufferSize * _frequency * TWO_PI / _sampRate);
    //println(getOffset());
  }
//*********************************
//END AudioSignal Interface members
//*********************************
}

