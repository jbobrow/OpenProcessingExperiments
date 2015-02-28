
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

void setup(){
  size(700,700, P3D);
  lights();
  camera(350,350,400,width/2,height/2,0,0,1,0);
 
  
  minim = new Minim(this);  
  song = minim.loadFile("2.mp3", 2048);
    
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  
  beat.setSensitivity(100); 
  kickSize = snareSize = hatSize = 16;
  bl = new BeatListener(beat, song);
  song.loop(); 
}
  
void draw(){
  
  delay(5);
  
  fill(255,50
);
  rectMode(CORNERS);
  rect(0,0,width,height);
  stroke(0,50);
  //noStroke();
  
  if ( beat.isKick() ) kickSize = 32;
  if ( beat.isSnare() ) snareSize = 32;
  if ( beat.isHat() ) hatSize = 32;
  
  translate (width/2,height/2);
  
pushMatrix();
translate(width/4,height/4);
fill(255,255,0,90);
sphere(hatSize*8);
popMatrix();

pushMatrix();
fill(0,0,255,90);
sphere(kickSize*7);
popMatrix();

pushMatrix();
translate(-width/4,-height/4);
fill(255,0,0,90);
sphere(snareSize*4);
popMatrix();
 

  
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
  
}
 
void keyPressed(){
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


