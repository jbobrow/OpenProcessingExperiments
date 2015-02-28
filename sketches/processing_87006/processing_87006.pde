
import ddf.minim.*;
PImage dImg;

Minim minim;
AudioPlayer dalekGun;
AudioPlayer exterminate;
Tardis myTardis;
float dXpos;
float bgroundColor;
boolean bMagic;

void setup() {
  size(800, 400);
  dImg = loadImage("Dalek.png");
  myTardis = new Tardis(600, 190, 200, 125);
  minim = new Minim(this);
  dalekGun = minim.loadFile("dalekgun.wav", 2048);
  exterminate = minim.loadFile("exterminate.wav", 2048);
}

void draw () {
  background(bgroundColor);
  bgroundColor=hour()*255/24;

  //dalek variable
  dXpos = second()*5;

  image(dImg, dXpos, 200); //Dalek
  myTardis.display();

  if (dXpos == 75 || dXpos == 150 || dXpos == 225 || dXpos == 300) {
    fill(0, 255, 255);
    noStroke();
    rect(dXpos-6+200, 280, 600-dXpos-200, 8);
    dalekGun.play();
    stroke(1);
   
  }
  if (dXpos == 80 || dXpos == 155 || dXpos == 230 || dXpos == 305) {
    exterminate.play();
  }

  if (dXpos < 200) {
    bMagic = true;
    myTardis.magicReset();
  }
  else {
    myTardis.magic();
    bMagic = false;
  }
}


void stop() {
  exterminate.close();
  dalekGun.close();
  minim.stop();
  super.stop();
}


