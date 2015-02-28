
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage skyline;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
int i;
Minim minim;
AudioPlayer midi;
AudioSample hehehahaha;

void setup() {
  skyline = loadImage("skyline.gif");
  a = loadImage("1.png");
  b = loadImage("2.png");
  c = loadImage("3.png");
  d = loadImage("4.png");
  e = loadImage("5.png");
  f = loadImage("6 c of 4.png");
  g = loadImage("7 c of 3.png");
  h = loadImage("8 c of 2.png");
  minim = new Minim(this);
  midi = minim.loadFile("midi.mp3");
  midi.play();
  midi.loop();
  hehehahaha = minim.loadSample("hehehahaha.mp3");
  size(600, 600);
  i = int(1);
}

void draw() {
  image(skyline, 0, 0);
  noTint();
  i++;
 if ( i == 1){
  image(a, mouseX-200, mouseY-100);
 }
 if (i == 2){
  image(b, mouseX-200, mouseY-100);
 }
 if ( i == 3){
  image(c, mouseX-200, mouseY-100);
 }
 if ( i == 4){
  image(d, mouseX-200, mouseY-100);
 }
 if ( i == 5){
  image(e, mouseX-200, mouseY-100);
 }
 if ( i == 6){
  image(f, mouseX-200, mouseY-100);
 }
 if ( i == 7){
  image(g, mouseX-200, mouseY-100);
 }
 if ( i == 8){
  image(h, mouseX-200, mouseY-100);
  i = 1;
 }
}

void mousePressed() {
  hehehahaha.trigger(); 
}

