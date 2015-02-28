
PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
PFont font;


void setup(){
  font = loadFont("HelveticaNeue-CondensedBold-72.vlw");
  textFont(font);
  fill(0, 50);
  img = loadImage("toilet.JPG");
  minim = new Minim(this);
  player = minim.loadFile("flush.mp3", 2048);
  player.play();
  size(425, 275);
  smooth();
  noStroke();
}

void draw(){
  image (img, 0,0);
  text("flush", 235,225);
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

