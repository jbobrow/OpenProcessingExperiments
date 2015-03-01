
PImage amas;

import ddf.minim.*;

Minim minim;
AudioPlayer taytay;

void setup() {
  size (640, 952);
  amas = loadImage ("AMAs.JPG");
  minim = new Minim (this);
  taytay = minim.loadFile ("Blank Space.mp3");
  taytay.play();
}

void draw (){
  background (#FFFFFF);
  image (amas, 150, 200, 320, 476);
}


