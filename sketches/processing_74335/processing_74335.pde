

PImage a;

PImage b;

PImage c;

PImage d;

import ddf.minim.*;

AudioPlayer player;

Minim minim;

void setup(){

 size(800, 400);

 a = loadImage("normal key.png");

 b = loadImage("right key22.png");

 c = loadImage("simple lock.png");

 d = loadImage("lock with key.png");

minim = new Minim(this);

player = minim.loadFile("keyunlock.mp3", 2048);

}

void draw(){

  background(255);

  if(mouseX < 200){

  image(a, mouseX, 100);

  image(c, 500, 10);

  }

  if(mouseX < 400 && mouseX > 200){ 

  image(b, mouseX, 100);

  image(c, 500, 10);

  }

  

  if(mouseX > 400){

  image(d, 500, 10);

  player.play();

  player.rewind();

  

  } 

}

void stop()

{

  // always close Minim audio classes when you are done with them

  player.close();

  minim.stop();

  super.stop();

}


