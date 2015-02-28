
// Adam Oaks

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

void setup()
{
  size(600, 600, P3D);
  lights();
  noStroke();
  camera(600,600,500,width/2,height/2,0,0,1,0);
  
  minim = new Minim(this);  
  song = minim.loadFile("sab.mp3", 2048);

  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  

  beat.setSensitivity(100);
  kickSize = snareSize = hatSize = 16;
  bl = new BeatListener(beat, song);  
  
  song.loop();  
  
  song.mute();

}

void draw()
{

    background(255);

  if ( beat.isKick() ) kickSize = 40;
  if ( beat.isSnare() ) snareSize = 40;
  if ( beat.isHat() ) hatSize = 40;

translate(width/2,height/2); 

pushMatrix();
rotateX(song.left.level()*2);
fill(0,99,164,90);
box(kickSize*3,snareSize*10,hatSize*20);
popMatrix();

pushMatrix();
rotateY(song.right.level()*2);
fill(0,50);
box(snareSize*10,hatSize*20,kickSize*3);
popMatrix();

pushMatrix();
rotateZ(song.mix.level()*10*PI/2);
fill(0,80);
box(hatSize*20,kickSize*3,snareSize*2);
popMatrix();
  
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
  
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


