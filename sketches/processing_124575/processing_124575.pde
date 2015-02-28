


import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer playPig;
AudioPlayer playDog;
AudioPlayer playCat;

AudioPlayer playTpig;
AudioPlayer playTdog;
AudioPlayer playTcat;

AudioPlayer playCpig;
AudioPlayer playCdog;
AudioPlayer playCcat;

PImage pig;
PImage dog;
PImage cat;


void setup() {

  size(1200, 500);
  background (0);

  minim = new Minim(this);
  playPig = minim.loadFile("Pig.mp3");
  playDog = minim.loadFile("Dog.mp3");
  playCat = minim.loadFile("Cat.mp3");

  playTpig = minim.loadFile("Tpig.mp3");
  playTdog = minim.loadFile("Tdog.mp3");
  playTcat = minim.loadFile("Tcat.mp3");

  playCpig = minim.loadFile("Cpig.mp3");
  playCdog = minim.loadFile("Cdog.mp3");
  playCcat = minim.loadFile("Ccat.mp3");

  pig=loadImage("pig.png");
  dog=loadImage("dog.png");
  cat=loadImage("cat.png");
}

void draw() {
  noStroke();
  fill(255, 051, 153);
  rect(0, 0, 400, 500);
  fill(102, 204, 255);
  rect(400, 0, 400, 500);
  fill(255, 153, 051);
  rect(800, 0, 400, 500);
  fill(255, 255, 255);
  ellipse(200, 275, 350, 350);
  ellipse(600, 275, 350, 350);
  ellipse(1000, 275, 350, 350);

  image(pig, 45, 120);
  image(dog, 445, 130);
  image(cat, 850, 130);

  fill(255, 255, 255);
  textSize(50);
  text("Animal Sounds in Different Languages", 140, 65); 
  textSize(20);
  text("Hover the cursor over any animal and press (E) for English, (T) for Turkish, and (C) for Chinese ", 150, 485);
}

void keyPressed() {
  if (key == 'e') { 
    playPig.cue(0);
    if (mouseX<width/3) {
      if (mouseY<height) {
        playPig.play();
      }
    }

    playDog.cue(0);
    if ((mouseX>width/3) && (mouseX<width*.66)) {
      if (mouseY<height) {
        playDog.play();
      }
    }
    playCat.cue(0);
    if ((mouseX>width*.66) && (mouseX<width)) {
      if (mouseY<height) {
        playCat.play();
      }
    }
  }
  if (key == 't') { 
    playTpig.cue(0);
    if (mouseX<width/3) {
      if (mouseY<height) {
        playTpig.play();
      }
    }

    playTdog.cue(0);
    if ((mouseX>width/3) && (mouseX<width*.66)) {
      if (mouseY<height) {
        playTdog.play();
      }
    }
    playTcat.cue(0);
    if ((mouseX>width*.66) && (mouseX<width)) {
      if (mouseY<height) {
        playTcat.play();
      }
    }
  }
  if (key == 'c') { 
    playCpig.cue(0);
    if (mouseX<width/3) {
      if (mouseY<height) {
        playCpig.play();
      }
    }

    playCdog.cue(0);
    if ((mouseX>width/3) && (mouseX<width*.66)) {
      if (mouseY<height) {
        playCdog.play();
      }
    }
    playCcat.cue(0);
    if ((mouseX>width*.66) && (mouseX<width)) {
      if (mouseY<height) {
        playCcat.play();
      }
    }
  }
}



