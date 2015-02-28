
/**
 * freq_thing_2
 **/

/** initial volume **/
public int vol = 70; 

/** initial bpm **/
public float bpm = 110;

import controlP5.*; 
import ddf.minim.*; 
import ddf.minim.signals.*; 

ControlP5 gui; 
Minim minim; 
AudioOutput out; 
SineWave sine; 

void setup() 
{ 
  size( 650, 150 ); 
  initializeMinim(); 
  initializeGui(); 
  println( "440 ? " + getFreq( 23 ) );
} 

void initializeMinim() 
{ 
  minim = new Minim(this); 
  out = minim.getLineOut(Minim.STEREO, 2048); 
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out 
  sine = new SineWave(440, 0.5, out.sampleRate()); 
  // set the portamento speed on the oscillator to 200 milliseconds 
  sine.portamento(200); 
  // add the oscillator to the line out 
  out.addSignal(sine); 
} 

void initializeGui() 
{ 
  gui = new ControlP5(this); 
  gui.addNumberbox("volume", vol, 50, 50, 50, 14 ); 
  gui.addMatrix("pitchEvent", 4, 12, 200, 20, 400, 12*8);
  Matrix m = (Matrix) gui.controller( "pitchEvent" );
  m.setInterval( beatIntervalMillis( bpm ) );
} 

void draw() { 
  background(0); 
} 

void volume(int amt) {
  int minimum = 0;
  int maximum = 100;
  if( minimum <= amt && amt <= maximum )
  {
    vol = amt;
    sine.setAmp( (float)vol/maximum );
  }
  else
  {
    vol = ( amt < minimum ? minimum : maximum );
    gui.controller( "volume" ).setValue( vol );
  }
}

void controlEvent(ControlEvent theEvent) {
  if( theEvent.controller().name().equals( "pitchEvent" ) )
  {
    Matrix m = (Matrix) theEvent.controller();
    sine.setFreq( getFreq( 4, 13 - m.getY( m.value() ) ) );
  }
}


/** 
 * For Minim 
 **/
void stop() 
{ 
  out.close(); 
  minim.stop(); 
  super.stop(); 
}


// library-ish functions //////////////////////
public int beatIntervalMillis( float bpm )
{
  int beatIntervalMillis;
  // millisPerBeat 
  // = secondsPerBeat * millisPerSecond 
  // = ( minutesPerBeat * secondsPerMinute ) * millisPerSecond
  // = ( secondsPerMinute / beatsPerMinute ) * millisPerSecond
  beatIntervalMillis = (int) ( (60./bpm) * 1000 );
  return beatIntervalMillis;
}

public int getMidiNum( int octave, int note )
{
   octave = constrain( octave, -1, 10 );
   note = constrain( note, 1, 12 );
   return ( octave + 1 ) * 12 + note - 1;
}

public float getFreq( int num )
{
  num = constrain( num, 0, 119 );
  return 440.0 * pow( 2, ( num - 69.0 ) / 12.0 );
}

public float getFreq( int octave, int note )
{
  return getFreq( getMidiNum( octave, note ) ); 
}

