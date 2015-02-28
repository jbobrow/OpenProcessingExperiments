
/**
 REALTIME COCOMATON by PROCESSING
 WITH MINIM AUDIO SUPPORT
  */

import ddf.minim.*;
import processing.video.*;
Capture video;
PImage camTemp;
int camCount;
int i;
int j;
Minim minim;
AudioPlayer player;

void setup()
{
  int i=5;
  int j=0;
  size(1440, 900, P2D);
  PImage bg;
  bg = loadImage("http://ansehyun.com/cocomaton/bg.png");
  background(bg);
  video = new Capture(this, 160, 120);
  video.start();
  camTemp = new PImage();
  camCount = 0;
  /*frameRate(30);*/
  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("bg.mp3", 2048);
  // play the file
}
void draw(){
  if (video.available()) {
    video.read();
    video.loadPixels();
    video.filter(GRAY);
    camTemp=video;
    image(camTemp, 3*video.width, 5*video.height);
    if(j!=5){
      for(int ii=0; ii<=video.width; ii++){
      for(int jj=0; jj<=video.height; jj++){
        set((j+4)*video.width+ii,i*video.height+jj,
        get((j+3)*video.width+ii, i*video.height+jj));
      }
    }
  }
  else{
    for(int ii=0; ii<=video.width; ii++){
    for(int jj=0; jj<=video.height; jj++){
      set(3*video.width+ii,(i-1)*video.height+jj,
      get((j+3)*video.width+ii, i*video.height+jj));
    }
  }
}

j++;
if(j>=6){
  i--;
  j=0;
  if(i<0){
    i=5;
  }
}

updatePixels();
}
}


void mousePressed() {
  if(mouseButton==LEFT){
    video.stop();
    player.play();


  }
  else if(mouseButton==RIGHT){
    video.start();
      minim = new Minim(this);
      player = minim.loadFile("bg.mp3", 2048);
  } 
}



