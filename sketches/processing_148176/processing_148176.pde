

import gifAnimation.*;
Gif nonLoopingGif;
boolean pause = false;

public void setup() {
  size(2126, 650);
  frameRate(100);
  
  println("gifdeCecil " + Gif.version());
  nonLoopingGif = new Gif(this, "gifdeCecil.gif");
  nonLoopingGif.play();
  nonLoopingGif.ignoreRepeat();
  // create the PImage array for the interactive display
}

void draw() {
  background(255 ); //cambia el color de fondo
  image(nonLoopingGif, width/2 - nonLoopingGif.width/2, height / 2 - nonLoopingGif.height / 2);
}

void mousePressed() {
  nonLoopingGif.play();
}




