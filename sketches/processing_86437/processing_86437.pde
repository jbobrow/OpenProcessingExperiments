
import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
 
float sphereRadius = 100;
 
Minim minim;
AudioPlayer music;
BeatDetect beat;
BeatListener bl;
 
float kickSize, snareSize, hatSize;
 
void setup(){
    size(1024, 768, P3D);
    minim = new Minim(this);
    music = minim.loadFile("dive.mp3", 2048);
    music.loop();
    beat = new BeatDetect(music.bufferSize(), music.sampleRate());
    beat.setSensitivity(300);
    kickSize = snareSize = hatSize = 16;
   
    bl = new BeatListener(beat, music);
   
    hint(ENABLE_DEPTH_TEST);
    hint(ENABLE_DEPTH_SORT);
   
}
 
void draw(){
 
    background(0,0,0);
    noFill();
    //fill(255, 225, 255, 0);
    
    if (beat.isKick() ) kickSize = 250;
    if (beat.isSnare() ) snareSize = 250;
    if (beat.isHat() ) hatSize = 250;
 
    pushMatrix();
    translate(width/2, height/2);
//    translate(width/3, height-height/4);
    rotateX( map(mouseY,0,height,0,TWO_PI));
    rotateY( map(mouseX,0,width,0,TWO_PI));
    sphereDetail(12, 12);
    sphere(kickSize);
    stroke(0, 255, 0);
    popMatrix();
   
    pushMatrix();
        translate(width/2, height/2);
//    translate(width/2, height/3);
    rotateX( map(mouseX,0,height,0,TWO_PI));
    rotateY( map(mouseY,0,width,0,TWO_PI));
    sphereDetail(12, 12);
    sphere(snareSize);
    stroke(0, 0, 255);
    popMatrix();
   
    pushMatrix();
        translate(width/2, height/2);
 //   translate(width-width/3, height-height/4);
    rotateX( map(mouseY,0,height,0,TWO_PI));
    rotateY( map(mouseX,0,width,0,TWO_PI));
    sphereDetail(12, 12);
    sphere(hatSize);
    stroke(255, 0, 0);
    popMatrix();
   
    kickSize = constrain(kickSize * 0.95, 100, 250);
    snareSize = constrain(snareSize * 0.95, 100, 250);
    hatSize = constrain(hatSize * 0.95, 100, 250);
}
 
void stop()
{
  music.close();
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


