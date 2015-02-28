

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

void setup()
{
  size(300, 300, P3D);
  
  minim = new Minim(this);  
  song = minim.loadFile("2.mp3", 2048);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  
    beat.setSensitivity(100);

  kickSize = snareSize = hatSize = 16;
  
  
  bl = new BeatListener(beat, song);  

  
  song.loop();  

}

void draw()
{

  delay(5);
  
  background(55);

  
  if ( beat.isKick() ) kickSize = 32;
  if ( beat.isSnare() ) snareSize = 32;
  if ( beat.isHat() ) hatSize = 32;
  fill(random(0,200),210,random(100,200),90);
  for(int a=0;a<height-30;a++){
  rect(width/6, a*10,kickSize,kickSize);
  }
  rect(width/2, height/2,snareSize,snareSize);
  rect(3*width/4, height/2,kickSize,kickSize);
  
  kickSize = constrain(kickSize * 0.95, 16, 100);
  snareSize = constrain(snareSize * 0.95, 16, 100);
  hatSize = constrain(hatSize * 0.95, 16, 100);
  strokeWeight(kickSize/300);
  stroke(255);
  for(int i=width/3;i<width;i++){
  line(i,0,i+kickSize,height);

  }


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


