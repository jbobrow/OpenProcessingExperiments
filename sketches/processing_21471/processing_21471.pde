
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
  mySound = minim.loadFile("Scalliwag.wav");
   
  beat = new BeatDetect(mySound.bufferSize(), mySound.sampleRate());
  beat.setSensitivity(100);
  kickSize = snareSize = hatSize = 5;
  bl = new BeatListener(beat, mySound);
  mySound.loop();
}
int n=0;
void draw(){
  background(255);
   
  if ( beat.isKick() ) kickSize = 30;
  if ( beat.isSnare() ) snareSize = 30;
  if ( beat.isHat() ) hatSize = 30;
   
  kickSize = constrain(kickSize * 0.95, 5, 30);
  snareSize = constrain(snareSize * 0.95, 5, 30);
  hatSize = constrain(hatSize * 0.95, 5, 30);
   
translate(width/4,height/4);
  for(float i = 0; i < mySound.bufferSize() - 1; i+=0.5)  {
    rotateX(n*-PI/3*0.5);
    float leftLevel = mySound.left.level() * 100;
    stroke(220,225,120,150);
    strokeWeight(random(2,10));
    line(0,0,kickSize*10,kickSize*10);
    
    rotateZ(n*-PI/3*0.2);
    stroke(100,150);
    line(0,0,snareSize*10,snareSize*10);
  
    rotateZ(n*-PI/3*0.2);
    stroke(110,200,180,150);
    line(0,0,hatSize*10,hatSize*10);


  }
  n++;
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


