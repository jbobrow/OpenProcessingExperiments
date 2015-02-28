
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

float coordX = 0;
float coordY = 0;
float size = 0;
PImage winter;
PImage summer;
Minim minim;
AudioPlayer raindrops;

void setup() {
  size(900, 600);
  winter = loadImage("winter.jpg");
  summer = loadImage("summer.jpg");
  image(winter,0,0);
  minim = new Minim(this);
  raindrops = minim.loadFile("pisarat2.mp3");
  raindrops.play();
}

void draw() {
 fill(#FBAAF9);
 coordX = random(1,900);
 coordY = random(1,600);
 size = random(10, 50);
 ellipse(coordX, coordY, size, size);
}

void keyReleased(){
  if (key == 's' || key == 'S') image(summer,0,0);
}




