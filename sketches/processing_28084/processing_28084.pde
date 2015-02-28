
import ddf.minim.*;

Minim minim;
AudioOutput out;
AudioPlayer ding;
AudioPlayer ding2;

int fishCount = 500;
int fishSize = 2;
float fishAttract = 0.91;
float foodSize = 40;
PImage bg;

Fish[] fishes = new Fish[fishCount+1];

void setup() {
  size(500,500);
  frameRate(60);
  smooth();
  bg = loadImage("background.jpg");

  minim = new Minim(this);
  out = minim.getLineOut();

  ding = minim.loadFile("ding3.mp3", 1024);
  ding2 = minim.loadFile("ding2.mp3",1024);

  for (int x = fishCount; x >= 0; x--) {
    fishes[x] = new Fish();
  }
}


void draw() {
  noCursor();
  image(bg,0,0);

  for (int i = fishCount; i >= 0; i--) {
    Fish fish = (Fish) fishes[i];
    fish.update(i);
  }
}

void mousePressed() {
  if (mouseButton == LEFT){
    ding.play(1);
  }
  else {
    ding2.play(1);
  }
 
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}


