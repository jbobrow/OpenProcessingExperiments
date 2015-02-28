
/**
  * This sketch demonstrates how to use the BeatDetect object in FREQ_ENERGY mode.<br />
  * You can use <code>isKick</code>, <code>isSnare</code>, </code>isHat</code>, <code>isRange</code>, 
  * and <code>isOnset(int)</code> to track whatever kind of beats you are looking to track, they will report 
  * true or false based on the state of the analysis. To "tick" the analysis you must call <code>detect</code> 
  * with successive buffers of audio. You can do this inside of <code>draw</code>, but you are likely to miss some 
  * audio buffers if you do this. The sketch implements an <code>AudioListener</code> called <code>BeatListener</code> 
  * so that it can call <code>detect</code> on every buffer of audio processed by the system without repeating a buffer 
  * or missing one.
  * <p>
  * This sketch plays an entire song so it may be a little slow to load.
  */

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

void setup()
{
  size(512, 500);
  smooth();
  
  minim = new Minim(this);  
  song = minim.loadFile("a6.2_GoodQuality.mp3", 2048);

  
  // a beat detection object that is FREQ_ENERGY mode that 
  // expects buffers the length of song's buffer size
  // and samples captured at songs's sample rate
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  
  // set the sensitivity to 300 milliseconds
  // After a beat has been detected, the algorithm will wait for 300 milliseconds 
  // before allowing another beat to be reported. You can use this to dampen the 
  // algorithm if it is giving too many false-positives. The default value is 10, 
  // which is essentially no damping. If you try to set the sensitivity to a negative value, 
  // an error will be reported and it will be set to 10 instead. 
  beat.setSensitivity(100);

  // set variables for the drawing  
  kickSize = snareSize = hatSize = 16;
  
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);  
  
  song.loop();  

}

void draw()
{
  // NS: a little fudge to sync the beats with the music
  delay(5);
  
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  
  if ( beat.isKick() ) kickSize = 8;
  if ( beat.isSnare() ) snareSize = 8;
  if ( beat.isHat() ) hatSize = 8;
  
  stroke(255);
  noFill();
  strokeWeight(1);
  
  ellipse(width/4, height/5,kickSize,(kickSize+snareSize+hatSize)/6);
  ellipse(width/2, height/5,snareSize,snareSize);
  ellipse(3*width/4, height/5,(kickSize+snareSize+hatSize)/6,hatSize);
  
  ellipse(width/2, 2.7*height/4,(height/100)*kickSize,(height/100)*(kickSize+snareSize+hatSize)/6);
  ellipse(width/2, 2.7*height/4,(height/100)*snareSize,(height/100)*snareSize);
  ellipse(width/2, 2.7*height/4,(height/100)*(kickSize+snareSize+hatSize)/6,(height/100)*hatSize);
  
  kickSize = constrain(kickSize, width/10, width/3);
  snareSize = constrain(snareSize, width/10, width/3);
  hatSize = constrain(hatSize, width/10, width/3);
  
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}



class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}


