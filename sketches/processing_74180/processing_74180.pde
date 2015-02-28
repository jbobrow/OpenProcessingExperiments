
import ddf.minim.*;
PImage a;

AudioPlayer player;
Minim minim;


void setup() {
  size(500,400);
  a = loadImage("Atomic-bomb-facts-Fat-Man.jpg");
  minim = new Minim(this);
  player = minim.loadFile("93741__omar-alvarado__explosion.mp3", 2048);
  player.play();

  
}

void draw() {
  image(a, 0, 0);
  // not really doing anything here
  
}

