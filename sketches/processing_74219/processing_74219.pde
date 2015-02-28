
import ddf.minim.*;
int numFrames = 4;
int frame = 0;

PImage[] images = new PImage[numFrames];
PFont fontA;

AudioPlayer player;
Minim minim;

void setup() {
  size (600, 380);
  frameRate(1);
  fontA = loadFont("Gisha-Bold-48.vlw");
  textFont(fontA, 40);

  images[0] = loadImage("doormat.jpg");
  images[1] = loadImage("doormat1.jpg");
  images[2] = loadImage("doormat2.jpg");
  images[3] = loadImage("doormat3.jpg");

  minim = new Minim(this);
  player = minim.loadFile("oh-no-2.wav");
}

void draw() {

  frame = (frame+1) % numFrames;
  image(images[frame], 0, 0);

  if (mouseX>=50 && mouseY>= 100) {
    player.play();
    text("NOT YOU AGAIN", 150, 200);
  }
}


