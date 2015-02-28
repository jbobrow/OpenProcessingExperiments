
import ddf.minim.*;
Minim minim;
AudioInput in;
PFont police;


void setup() {
  size(620,620);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);

  police = loadFont("super.vlw");
 
}

void draw() {
background(in.mix.level()*10000);
logo();
}

void logo(){
  fill(0);
  textFont(police,70);
  text("Dessiner",10,300); 
  
  
  fill(0);
  textFont(police,70);
  text("le SON",12,360);
  
}

void stop() {
  in.close();
  minim.stop();
  super.stop();
}

