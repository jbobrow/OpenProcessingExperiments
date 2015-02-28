
//Hung Wing Chu Charlie
//52627887

import ddf.minim.*;

PImage bg, img1, img2, img3;

Minim minim;
AudioPlayer bgsound;
AudioSample bit, eat, bath;

int numFrames = 3;
int frame = 0;
PImage[] image = new PImage[numFrames];


void setup() {
  size(600, 400);
  background(255);
  imageMode(CENTER);
  
  frameRate(8);
  
  image[0] = loadImage("rain-06.png");
  image[1] = loadImage("rain-07.png");
  image[2] = loadImage("rain-08.png");
  
  minim = new Minim(this);
  bgsound = minim.loadFile("Gameplay.wav");
  bit = minim.loadSample("gameplay_se.wav");
  eat = minim.loadSample("okori.wav");
  bath = minim.loadSample("yobidashi.wav");
  
  bgsound.play();
  bgsound.loop();

  bg = loadImage("bg-01.png");
  img1 = loadImage("bg.png");
  img2 = loadImage("man.png");
  img3 = loadImage("eat.png");
  
  image(bg, 300, 200);
  
}
 

void draw() {

  image(img1, 200, 200);
  image(img2, 200, 250);
  
  if (mousePressed == true) {
    bit.trigger();
  }
  
  if (keyPressed == true) {
    if (key == 'e') {
      image(img3, 250, 270);
      eat.trigger();
    }
    else if (key == 'b') {
      frame = frame + 1;
      while (frame>=numFrames) {
        frame = 0;
      }
      image(image[frame], 200, 195);
      bath.trigger();
    }
  }
}

