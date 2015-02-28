


import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

void setup()
{
  size(512, 400, P3D);
  
  minim = new Minim(this);  
  song = minim.loadFile("Flosstradamus Podcast.mp3", 2048);

  
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
  
  

  rectMode(CENTER);
  
  song.loop();  
background(0);
}

void draw()
{
  // NS: a little fudge to sync the beats with the music
  delay(3);
  
 // background(0);
  stroke(26,kickSize/3,hatSize/4);
  strokeWeight(4);
  fill(kickSize,snareSize,45,25);
  if ( beat.isKick() ) kickSize = 80;
  if ( beat.isSnare() ) snareSize = 80;
  if ( beat.isHat() ) hatSize = 80;
  
  ellipse(width/4,height/2,kickSize,kickSize);

  ellipse(width/2,snareSize,kickSize,hatSize);
 // text("SNARE", width/2, height/2);
  textSize(hatSize);
  ellipse( 3*width/4, height/2,hatSize,hatSize);
  
  kickSize = constrain(kickSize*2, 0, 212);
  snareSize = constrain(snareSize*2, 0, 212);
  hatSize = constrain(hatSize*2, 0, 212);
  
}

 void keyPressed()
{
  if ( key == 'm' )
  {
    if ( song.isMuted() )
    {
      song.unmute();
    }
    else
    {
      song.mute();
    }
  }
}

void stop()
{
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


