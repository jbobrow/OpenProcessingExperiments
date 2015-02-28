
import ddf.minim.*;
int numFrames = 5;
int frame = 0;

PImage[] images = new PImage[numFrames];


AudioPlayer player;
Minim minim;

void setup() {
  size (600, 443);
  frameRate(0.8);

  images[0] = loadImage("1.1.jpg");
  images[1] = loadImage("1.jpg");
  images[2] = loadImage("2.jpg");
  images[3] = loadImage("3.jpg");
  images[4] = loadImage("3.1.jpg");

  
  
  
  
  minim = new Minim(this);
  player = minim.loadFile("kettle.aif");
  player.play();
}

void draw() {

  frame = (frame+1) % numFrames;
  image(images[frame], 0, 0);
}

void stop(){
  player.close();
}

