
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample flute;
PImage wheel;


void setup(){
  size(800,600);
  wheel=loadImage("medicine_wheel.png");
  minim = new Minim(this);
  flute = minim.loadSample("532138_SOUNDDOGS__th[1].mp3");
}

void draw(){
  image(wheel,100,0,600,600);
  if (mousePressed == true) {
  textSize(32);
  fill(#000000);
  text("Physical", 340, 120);
  text("Emotional", 500, 310);
  fill(#FFFCFC);
  text("Mental", 340, 500);
  text("Spiritual", 170, 310);
  }
 
}
void mouseReleased(){
    if (true)flute.trigger();}

