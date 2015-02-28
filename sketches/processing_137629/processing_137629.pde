

import ddf.minim.*;
Minim minim;
AudioPlayer bells;

void setup(){
  minim = new Minim(this);
  bells = minim.loadFile("preview.mp3");
}



