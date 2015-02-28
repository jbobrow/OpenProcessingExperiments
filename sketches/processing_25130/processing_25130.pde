

import ddf.minim.*;
import ddf.minim.signals.*;
PImage img;

AudioOutput out;   

Minim minim;
AudioPlayer song;

float numFrames = 100;

void setup() {
  size(700,525);
  rectMode(CENTER);
  img = loadImage ("clouds.jpg");

  minim = new Minim(this); 
  song = minim.loadFile("oceanfade.mp3", 2048);
  song.play();

  out = minim.getLineOut(Minim.STEREO, 512);    

  song.loop();
}

void draw() {

  
  background(img);
  noStroke();

  float mylevel = song.mix.level()*100;

  for(int i = 0; i < song.bufferSize() - 1; i++) {
    fill(255,20);
    rect(i,530,50,250+song.left.get(i)*200);
    fill(84,113,120,90);
    rect(i,535,50,250+song.right.get(i)*200);
    fill(92,162,180,30);
    ellipse(random(0,width),random(400,525),mylevel,mylevel);
  }
  if (frameCount <= numFrames) {
    saveFrame("circles-####.tif");

 }
}

void keyPressed(){
  
  if ( key == 'm' ){
    if ( out.isMuted() )
    {
      out.unmute();}
    else
    {
      out.mute();
    }
}
}


void stop() {
  out.close();
  minim.stop();

  super.stop();
}




