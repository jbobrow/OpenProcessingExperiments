
//import processing.dxf.*;
//boolean record;

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;         
AudioPlayer out;
AudioMetaData meta;

int gen = 1;


void setup() {
  size(500,500,P2D);
  frameRate(3);
  background(255);


  minim = new Minim(this);
  out = minim.loadFile("a6.2_GoodQuality.mp3");
  out.play();
}




void keyPressed() {
  if ( key == 'm' ) {
    if ( out.isMuted() ) {
      out.unmute();
    } 
    else {
      out.mute();
    }
  }
}


void draw() {

  //beginRaw(DXF, "output.dxf");

  color on = color(out.mix.level()*255);
  color off = color(255);
  strokeWeight(100);
  for(int i = 1; i < width-1;i++) {
    if((out.left.level()-out.right.level())>0) {
      set(i, gen, on);
    }
  }
  gen++;
  if(gen > height-1) {
    noLoop();
  }
  //endRaw();
}


