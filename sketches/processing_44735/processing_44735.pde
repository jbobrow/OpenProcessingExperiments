
PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup(){
  img = loadImage("kettlesteam.JPG");
  minim = new Minim(this);
  player = minim.loadFile("whistle.wav", 2048);
  player.play();
  size(425, 275);
  smooth();
  noStroke();
}

void draw(){
  image(img, 0,0);
  fill(#AAA5A5, 75);
  ellipse(260, 140, 115,115);
  fill(#D8D8D8, 50);
  ellipse(310, 40, 100,100);
  fill(#AAA5A5, 90);
  ellipse(260, 130, 90,90);
  fill(#D8D8D8, 80);
  ellipse(310, 20, 70,70);
  fill(#AAA5A5,95);
  ellipse(290, 100, 90,90);
  fill(#D8D8D8,95);
  ellipse(330, 0, 70,70);
  
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

