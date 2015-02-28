
PImage img1;
PImage img2;
PImage img3;
int r;
int g;
int b;
import ddf.minim.*;
float bx;
float by;

 
Minim minim;
AudioPlayer song;

void setup() {
  size(600, 800);
  bx = width/2.0;
  by = height/2.0;
  minim = new Minim(this);
  song = minim.loadFile("dusthead.mp3");
  r = (int)random(255);
  b = (int)random(255);
  g = (int)random(255);
  frameRate(10);
  img3 = requestImage("reagan1.png");
  img2 = requestImage("joint.png");
  img1 = requestImage("reagan2.png");
  smooth();
}

void draw() {
  r = (int)random(150, 255);
  frameRate(20);
  if(mouseX > bx + 40 && mouseX < bx + 130 &&
     mouseY > by - 10 && mouseY < by + 30) {
    background(r, 50, 50);
    image(img1, 0, 0, 600, 800);
    song.play();
    song.unmute();
  }
  else {
    image(img3, 0, 0, 600, 800);
    song.mute();
    image(img2, mouseX - 50, mouseY - 50, 75, 75);
  }
}


void stop() {
  song.close();
  minim.stop();
  super.stop();
}

