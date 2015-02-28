
//import Minim
import ddf.minim.*;

//declare global variables
PImage fly;
float x;
float y;
float easing = 0.05;
Minim minim;
AudioPlayer bzz;

//load from HDD
void setup() {
  size(800, 600); 
  noStroke();
  fly = loadImage("flypink.jpg");
  minim = new Minim(this);
  bzz = minim.loadFile("bzz.wav");
  bzz.play();
  bzz.loop();
}

void draw() { 
  background(#EAC9C9);
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  image(fly, x, y, 66, 66);
}

