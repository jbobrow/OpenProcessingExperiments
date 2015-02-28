
PImage a;
PImage b;

import ddf.minim.*;

AudioPlayer playerX;
Minim minim;

void setup(){
  size(1280, 960);
  a = loadImage("Lights on.jpg");
  b = loadImage("Lights out.jpeg");
  minim = new Minim(this);
  playerX = minim.loadFile("Scare.mp3", 2048);
  
}

void draw(){
  image(a,0,0,1280,960);
  if(mousePressed) {playerX.play();
  image(b,0,0,1280,960);
  }
}

