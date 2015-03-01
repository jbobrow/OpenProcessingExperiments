
/**
  * This sketch is made on the ground of demo "FrequencyEnergyBeatDetection" from Minim package, to demonstrate 
  * how to use image effect to visualize Kick, Snare, and Hat.
  * Lu F. 2014. Nov 18, fyafeng@qq.com
  */
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
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/
  */

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
PImage bgimage;

float kickTxtsize=120, snareTransx=0, snareTransy=0, easing=0.05, hatTint=20;

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

void setup()
{
  size(1024, 768, P3D);
  
  minim = new Minim(this);
  
  song = minim.loadFile("The Miracle.mp3", 1024);
  song.play();
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
  beat.setSensitivity(50);  
  kickTxtsize=120;
  hatTint=20;
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);  
  textFont(createFont("Trajan Pro 3", 120));
  textAlign(CENTER);
  bgimage=loadImage("queen.jpg");
}

void draw()
{
  background(0);
  
  if ( beat.isKick() ) kickTxtsize = 180;
  if ( beat.isSnare() ) {snareTransx = 15; snareTransy=5;}
  if ( beat.isHat() ) hatTint = 80;
  float a = map(hatTint, 20, 80, 80, 255);
  tint(a);
  image(bgimage,0,0); 
  hatTint *= 0.95;
  if ( hatTint < 20 ) hatTint = 20;
  
  float dx = -snareTransx, dy = -snareTransy;
  snareTransx +=dx*easing;
  snareTransy +=dy*easing;
  if (abs(snareTransx)>15 || abs(snareTransy)>5) {snareTransx=0; snareTransy=0;}
  tint(a, 100);  // Display at half opacity
  image(bgimage, snareTransx,-snareTransy);

  
  textSize(kickTxtsize);
  fill(0, 125, 220, 130);
  text("QUEEN", width/2, height*10/17,2);
  kickTxtsize = constrain(kickTxtsize * 0.95, 120, 180);
}


