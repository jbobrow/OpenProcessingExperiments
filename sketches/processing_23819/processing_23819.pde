
import gifAnimation.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player;

PImage[] animation;

void setup() {
  size(720, 450);
  frameRate(6);  
  animation = Gif.getPImages(this, "feet.gif");
  minim = new Minim(this);
  player = minim.loadFile("beep.mp3", 2048);
  player.loop(100);
}

void draw() {
  image(animation[(int) (animation.length / (float) (width) * mouseX)], width - 10 - animation[0].width, height / 2 - animation[0].height / 2);
  tint (100, 90);
}


