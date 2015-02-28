
PImage img;
import ddf.minim.*;
Minim minim;
AudioPlayer song;

float a;
float b;

void setup(){
  size (850,600);
  img = loadImage ("kings.jpg");
  
  minim = new Minim(this);
  song = minim.loadFile("fourkicks.mp3");
  song.play();

  noStroke();
  smooth();
  colorMode(HSB, 255);
  
}

void draw(){
  image(img, 0, 0);
  

  a += 10;
  stroke (#FFFFFF, 50);
  for (b = random(b); b < 1000; b+=10) {
    line (width/2+50, height/2+800, random(b), random(b));
    
    stroke (#000000, 50);
    line (width/2+350, height/2+800, random(b), random(b));
  }
  
};


