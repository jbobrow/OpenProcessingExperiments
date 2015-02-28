
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioPlayer song2;
BeatDetect beat;

PImage bflyImg;
PImage mouseImg;
PImage blankImg;
PImage growImg;

void setup() {
  size(500, 500);
  

  background(147,49,219);
  minim = new Minim(this);
  song = minim.loadFile("purpose.wav");
  song2 = minim.loadFile("butterland.wav");
  song.loop();
  beat = new BeatDetect();
  bflyImg = loadImage("images.gif");
  blankImg = createImage(1,1,ARGB);
  growImg = loadImage("aflower.gif");
  mouseImg = blankImg; 
  }
float distance;


void draw() {
  fill(147,49,219,10);
  rect(0,0,width,height);
  beat.detect(song.mix);
  if (beat.isOnset()) {
    fill(255);
  rect(0,0,width,height);
    }
 
 float butterflatter = width*sin(frameCount*.01);
 float one = mouseX+butterflatter;
 float two = mouseY+butterflatter;
 
  
  image(growImg,0,200);
  image(mouseImg, mouseX+butterflatter, mouseY+butterflatter);
  distance = dist(mouseX+butterflatter,mouseY+butterflatter,0,200);
  if(distance<100)
  {
   song2.play();
  }
 
 boolean collided  = true;
 if (one<100)
 {
   one=100;
   collided = true;
 }
 if (one>100)
 {
   one=100;
   collided = false;
 }
 if (two<100)
 {
   two=100;
   collided = true;
 }
  if (two>100)
  {
    two=100;
    collided = false;
  }
   if(collided)
  {
   song2.rewind();
  }

  if(mousePressed)
  {
    mouseImg = bflyImg;
  }
  else
  {
    mouseImg = blankImg;
  }
 
}
void stop() {

  song.close();
  song2.close();
  minim.stop();
  super.stop();
}


