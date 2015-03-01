
// Day of the Dead Skull (work in Progress)
// By Jace Harrison Crowley
// www.harrisoncrowley.com

import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioInput input;
PImage photo;




void setup() {
  frameRate(30);
  noCursor();
  bg = loadImage("Gradient4new.jpg");
  photo = loadImage("Skull1.png");
  size(700, 700);
  minim = new Minim(this);
  player = minim.loadFile("Skull.mp3");
  input = minim.getLineIn();
}


void draw() {
  frameRate(30);
  image(photo, mouseX -50, mouseY -50);
  if (mousePressed == true) {
    filter(INVERT);
  }
}
void mousePressed()
{
  player.play();
}

void mouseReleased()
{
  player.pause();
}



