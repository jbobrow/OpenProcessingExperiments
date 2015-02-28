
import ddf.minim.*;
int numFrames = 13;
int frame = 0;

PImage[] images = new PImage[numFrames];


AudioPlayer player;
Minim minim;

void setup() {
  size (400, 480);
  frameRate(1.5);

  images[0] = loadImage("11.1.jpg");
  images[1] = loadImage("11.jpg");
  images[2] = loadImage("10.jpg");
  images[3] = loadImage("9.jpg");
  images[4] = loadImage("8.jpg");
  images[5] = loadImage("7.jpg");
  images[6] = loadImage("5.jpg");
  images[7] = loadImage("4.jpg");
  images[8] = loadImage("3.jpg");
  images[9] = loadImage("2.jpg");
  images[10] = loadImage("1.jpg");
  images[11] = loadImage("1.1.jpg");
  
 

  minim = new Minim(this);
  player = minim.loadFile("tap.mp3");
  player.play();
}

void draw() {

  frame = (frame+1) % numFrames;
  image(images[frame], 0, 0);
}

void stop(){
  player.close();
}

