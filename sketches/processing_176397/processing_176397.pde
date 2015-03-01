
import ddf.minim.signals.*;//variois parts of the minim libary
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;

Minim minim;//minim setup
AudioPlayer song;//calling audioplayer and linking to song
BeatDetect beat;//linking beatdetect(BeatDetect class allows you to analyze an audio stream for beats) to the word beat
BeatListener bl;
ArrayList balls = new ArrayList();

void setup()
{
  size(400, 200);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  frameRate( 30 );
  smooth();
  song = minim.loadFile("Sub Focus - Close.mp3", 2048);

  beat = new BeatDetect(song.bufferSize(), song.sampleRate());//The internal buffer size of this sound object//
  //Returns the sample rate of this UGen.//
  beat.setSensitivity(0); 
  bl = new BeatListener(beat, song);  

  song.play();
  noStroke();
}

void draw()
{
  textSize(14);
  



  fill( 0, 0, 0, 45 );
  rect(0, 0, width, height);
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  boolean kick = beat.isKick();//In frequency energy mode this returns true if a beat corresponding to the frequency range of a kick drum has been detected.
  boolean hat = beat.isHat();//In frequency energy mode this returns true if a beat corresponding to the frequency range of a hi hat has been detected.
  boolean snare = beat.isSnare();//In frequency energy mode this returns true if a beat corresponding to the frequency range of a snare has been detected.
  if (hat == true){
    fill(255);
    rect(50,50,50,50);
    fill(0);
    text("Hat", 50, 80);
  }
  if (kick == true){
    fill(255,255,0);
    rect(150,50,50,50);
    fill(0);
    text("Kick", 150, 80);
    
  }
  if (snare == true){
    fill(255,0,255);
    rect(250,50,50,50);
    fill(0);
    text("Snare", 250, 80);
  }
}
void stop()
{
  // always close Minim audio classes when you are done with them
  song.close();
  minim.stop();

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








