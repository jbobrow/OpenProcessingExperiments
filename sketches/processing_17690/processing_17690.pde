
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

PImage img;

float eRadius;

void setup()
{
  size(500, 500, P3D);
  minim = new Minim(this);
  song = minim.loadFile("Cuddle_Fuddle.mp3", 800);
  song.play();
  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect();
  
  img = loadImage("clarkbeat.jpg");
  
  ellipseMode(CENTER_RADIUS);
  eRadius = 20;
}

void draw()
{
  background(#F4F4F4);
  beat.detect(song.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  fill(#005F7F, a);
  noStroke();
  if ( beat.isOnset() ) eRadius = 80;

  image(img, width/2-(img.width/75*eRadius)/2, height/2-(img.height/75*eRadius)/2, img.width/75*eRadius, img.height/75*eRadius);

  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}


