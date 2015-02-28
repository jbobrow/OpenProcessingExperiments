


import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

void setup(){
  size(600, 600, P3D);
  smooth();
  
  minim = new Minim(this);  
  song = minim.loadFile("Pico.mp3", 2048);

  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(2);


  kickSize = song.mix.level()*50;
  snareSize = song.right.level()*30;
  hatSize = song.left.level()*20;
  
  bl = new BeatListener(beat, song);  
  song.loop();  

}

void draw(){
  rectMode(CORNERS);
  noStroke();
  fill(0,10);
  rect(0,0, width, height);
  fill(255,75);
 
  
  if (beat.isKick())
    kickSize += 50;
    else kickSize = song.mix.level()*500;
    
  if ( beat.isSnare())
    snareSize += 30;
    else snareSize = song.right.level()*300;
  
  if ( beat.isHat())
    hatSize += song.left.level()*200;
  
  if (kickSize > 200){
     kickSize = -kickSize;
     snareSize = -snareSize;
     hatSize = -hatSize;
  }
     
  

  ellipse(mouseX,mouseY,kickSize,kickSize);
  
  
  
  rotate(PI/hatSize*100);
  fill(100,0,0,75);
  rectMode(CENTER);
  rect(height-mouseX,width-mouseY,-snareSize,snareSize);

strokeWeight(10);
  stroke(0,random(100,255),0,50);
 for(int i = 0; i < song.bufferSize() - 1; i++){
    line(i,song.left.get(i)*50,i+1,song.left.get(i+1)*50);
    
  }
  stroke(255);
  strokeWeight(song.right.level()*2);
    line(mouseX,mouseY,height-mouseX,width-mouseY);
}


void keyPressed(){
  
  
  if ( key == 'm' ){
    if (song.isMuted()){
      song.unmute();
}
    else{
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


