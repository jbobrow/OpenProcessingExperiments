
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim; 
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;
 
void setup(){
  size(500,500,P3D);
  background(0);
  smooth();
   
  minim = new Minim(this);   
  mySound = minim.loadFile("groove.mp3");
  mySound.loop();

 
beat = new BeatDetect(mySound.bufferSize(), mySound.sampleRate());

beat.setSensitivity(100);

kickSize = 16;
snareSize = 8;
hatSize = 4;

bl = new BeatListener(beat, mySound);
}

void draw(){
  delay(5);
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  
  if(beat.isKick()) kickSize = 32;
  if(beat.isSnare()) snareSize = 16;
  if(beat.isHat()) hatSize = 8;
  
  rectMode(CENTER);
  translate(width/2,height/2);
  strokeWeight(kickSize);
  stroke(kickSize,kickSize,0,kickSize*4);
  rect(0,0,kickSize*2,kickSize*3);
  strokeWeight(snareSize);
  stroke(snareSize,snareSize,0,snareSize*4);
  rect(0,0,snareSize*2,snareSize*3);
  strokeWeight(hatSize);
  stroke(hatSize,hatSize,0,hatSize*4);
  rect(0,0,hatSize*2,hatSize*3);
  
  kickSize = constrain(kickSize * 0.95, 16, 32);
  kickSize = constrain(snareSize * 0.95, 16, 32);
  kickSize = constrain(hatSize * 0.95, 16, 32);
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  mySound.close();
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

