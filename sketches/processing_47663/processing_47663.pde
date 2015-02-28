
import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage img1;
PImage img2;
PImage img3;

void setup() {
  size(900, 506);
  
  img1 = loadImage("EBG.jpg");
  img2 = loadImage("inhale.png");
  img3 = loadImage("exhale.png");
  
  minim = new Minim(this);
  player = minim.loadFile("Loop_11.mp3");
  player.loop();
}

void draw () {
  image(img1,0 ,0);
  keyPressed(); 
    if ((key == 'e' )|| (key == 'E')) {
      image(img3, 355, 233);
    }
    if ((key == 'i' )|| (key == 'I')) {
      image(img2, 355, 233);
    }
  }

void stop(){  
  player.close();
  minim.stop();
  super.stop();
}



