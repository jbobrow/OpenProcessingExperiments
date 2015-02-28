
import processing.opengl.*;

import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer drum;
AudioPlayer lava;

int wNumber;
int hNumber;
float speedX;
float speedY;

Particle[][] particle;

void setup() {
  colorMode(HSB, 255);
  size(700, 400, OPENGL);
  minim = new Minim(this);
  song = minim.loadFile("explosion1.wav");
  song1 = minim.loadFile("explosion2.wav");
  song2 = minim.loadFile("explosion4.wav");
  song3 = minim.loadFile("explosion5.wav");
  lava = minim.loadFile("DryLava1.wav");
  drum = minim.loadFile("drum.wav");


  int partSize = 10;

  wNumber=(width)/partSize;
  hNumber=(height)/partSize;
  particle = new Particle[wNumber][hNumber];
  for (int i=0; i < wNumber; i++) {
    for (int j=0; j < hNumber; j++) {
      particle[i][j] = new Particle(i*partSize, j*partSize, partSize);
    }
  }
}

void draw() {
  colorMode(HSB, 255);
  background(39, 20, 45);
  boolean hit = false;
  pushMatrix();
  for (int i=0; i < wNumber; i++) {
    for (int j=0; j < hNumber; j++) {
      particle[i][j].draw();
      if (mousePressed== true) {
        particle[i][j].moves(mouseX, mouseY, pmouseX, pmouseY);
        if (!drum.isPlaying()) {
          drum.loop(0);
        }
      }
      else {
        hit=particle[i][j].spring(i, j, wNumber, hNumber);
        if (!lava.isPlaying()) {
          lava.loop(0);
        }
      }
    }
  }
  popMatrix();
  if (hit==true&&(speedX>30||speedY>30||speedX<=-30||speedY<-30)) {
    if (!song.isPlaying()) {
      song.loop(0);
    }
  } 
  else if (hit==true&&(speedX>20||speedY>20||speedX<=-20||speedY<-20)) {
    if (!song.isPlaying()) {
      song1.loop(0);
    } 
    else if (hit==true&&(speedX>10||speedY>10||speedX<=-10||speedY<-10)) {
      if (!song.isPlaying()) {
        song2.loop(0);
      }
    }
  }
}


void mouseReleased() {
  song.pause();
  song.rewind();
  song1.pause();
  song1.rewind();
  song2.pause();
  song2.rewind();
  song3.pause();
  song3.rewind();
  drum.pause();
  drum.rewind();

  for (int i=0; i < wNumber; i++) {
    for (int j=0; j < hNumber; j++) {
      PVector p = particle[i][j].speed();
      speedX=p.x;
      speedY=p.y;
      particle[i][j].direction();
    }
  }
}

void myThing(float x, float y, float w, float h) {
  noStroke();
  rect(x, y, w, h);
}


