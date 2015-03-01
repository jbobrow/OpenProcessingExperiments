
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample oralhistory;
PImage map;

void setup() {
  size(946, 639);
  map = loadImage("vector map.png");
  minim = new Minim(this);
  oralhistory = minim.loadSample("Rasheed.mp3");
}

void draw(){
  image(map, 0,0);
}

void keyPressed(){
  if (key == 'p' ) oralhistory.trigger();
  if (key == 'p' ) println("sample triggered");
}

