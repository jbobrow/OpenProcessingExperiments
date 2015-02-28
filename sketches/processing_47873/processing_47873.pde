

PImage img1;
PImage img2;
PImage img3;
int r;
int g;
int b;
import ddf.minim.*;

 
Minim minim;
AudioPlayer song;
AudioPlayer song1;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  song = minim.loadFile("party.mp3");
  song1 = minim.loadFile("spanishFlea.mp3");
  r = (int)random(255);
  b = (int)random(255);
  g = (int)random(255);
  frameRate(10);
  img1 = requestImage("Astronaut2Small.png");
  img2 = requestImage("Astronaut1Small.png");
  img3 = requestImage("moon-1Small.png");
  smooth();
}


void draw() {
  r = (int)random(255);
  b = (int)random(255);
  g = (int)random(255);
  frameRate(10);
  background(r, g, b);
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  if(weight > 20) {
    background(r, g, b);
    image(img1, mouseX - 100, mouseY - 100, 200, 200);
    song1.mute();
    song.play();
    song.unmute();
  }
  else {
    image(img3, 0, 0, 800, 600);
    song.mute();
    song1.play();
    song1.unmute();
    image(img2, mouseX - 100, mouseY - 100, 200, 200);
  }
}

void stop() {
  song.close();
  song1.close();
  minim.stop();
  super.stop();
}

