
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim; 
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;
int kickPoint = 16;
int snarePoint = 8;
int hatPoint = 4;

int a = 0;
int b = 0;
int c = 0;


void setup(){
  size(500,500,P3D);
  background(255);
  smooth();
  noStroke();
  
  minim = new Minim(this);   
  mySound = minim.loadFile("groove.mp3");
  mySound.loop();
  
  beat = new BeatDetect(mySound.bufferSize(), mySound.sampleRate());

beat.setSensitivity(1000);



bl = new BeatListener(beat, mySound);
}

void draw(){
  delay(5);
  
  //noStroke();
  //fill(255,50);
  //rect(0,0,width,height);
  
  
  if(beat.isKick()) a = width;
  if(beat.isSnare()) b = width;
  if(beat.isHat()) c = width;
  
  //snareTriangle
  if(beat.isSnare())
    fill(random(50,200),random(50,200),random(50,250),25);
    triangle(width/2,-100,b,random(500),b,random(500) + snarePoint);
  
  
  //kickTriangle
  if(beat.isKick())
    fill(random(50,250),25);
    triangle(-100,height/2,a,random(500),a,random(500) + kickPoint);
  
  
  //hatTriangle
  if(beat.isHat())
    fill(random(50,250),25);
    triangle(width/2,height+100,c,random(500),c,random(500) + hatPoint);
  
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

