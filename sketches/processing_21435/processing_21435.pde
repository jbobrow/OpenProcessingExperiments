
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

void setup(){
  size(400, 400,P3D);
  noStroke();
  minim = new Minim(this);
  mySound = minim.loadFile("UrBeautiful.mp3");
  
  beat = new BeatDetect(mySound.bufferSize(), mySound.sampleRate());
  beat.setSensitivity(100);
  kickSize = snareSize = hatSize = 5;
  bl = new BeatListener(beat, mySound); 
  mySound.loop();
}
void draw(){
  background(255);
  
  if ( beat.isKick() ) kickSize = 30;
  if ( beat.isSnare() ) snareSize = 30;
  if ( beat.isHat() ) hatSize = 30;
  
  kickSize = constrain(kickSize * 0.95, 5, 30);
  snareSize = constrain(snareSize * 0.95, 5, 30);
  hatSize = constrain(hatSize * 0.95, 5, 30);
  
  translate(width/2,height/2);
  for(int i = 0; i < mySound.bufferSize() - 1; i++)  {
    rotateX(PI/6);
    fill(255,10,150,150);
    ellipse(i,i,kickSize,kickSize);
    rotateY(PI/6);
    fill(255,255,10,150);
    ellipse(i,i,snareSize,snareSize);
    rotateZ(PI/3);
    fill(10,180,255,150);
    ellipse(i,i,hatSize,hatSize);
  }
}

void stop(){
  mySound.close();
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

//mute out
void keyPressed(){
  if ( key == 'm'|| key == 'M' ){
    if ( mySound.isMuted() ){
      mySound.unmute();
    }
    else{
      mySound.mute();
    }
  }
}

