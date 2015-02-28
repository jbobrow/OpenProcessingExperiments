
import ddf.minim.*;
Minim minim;
AudioPlayer player;

void setup(){
  size(1500, 750); 
  minim = new Minim(this);
  player = minim.loadFile("You Spin Me Right Round.mp3");
  player.play();
}

void draw() {
  PImage img = loadImage("imgres.png"); 
  scale(2.0);
  for (int i = 0; i<width; i+=50) {
    int x = int(random(img.width-10));
    int y = int(random(img.width+10));
    PImage crop = img.get(x, y, 1000, height);
    image(crop, i, 0);
  }
}


