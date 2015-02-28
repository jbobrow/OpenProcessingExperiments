
PImage img;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup(){
  img = loadImage("toothbrush.JPG");
  minim = new Minim(this);
  player = minim.loadFile("brushingteeth.mp3", 2048);
  player.play();
  size(425,275);
  smooth();
  noStroke();
}

void draw(){
  image (img, 0,0);
  tint(0,0,0,0);
  if (mousePressed == true) {
    fill(255);
    ellipse(mouseX, mouseY, 20,20);
    fill(#0C91E8);
    ellipse(mouseX, mouseY, 5,5);
  }
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

