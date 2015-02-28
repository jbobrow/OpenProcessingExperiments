
import ddf.minim.*;
PImage a;

AudioPlayer player;
Minim minim;

void setup() {
  size(500,500);
  a = loadImage("p_portrait_330.jpg");
  
  // now set up the 
  minim = new Minim(this);
  player = minim.loadFile("groove.mp3", 2048);
  
  player.play();
}

void draw() {
  background(255);
  float scaling = player.mix.get(player.left.size()-1) * 100;
  image(a, width/2 - (a.width/scaling)/2, 0, a.width/scaling, a.height/scaling);
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}

