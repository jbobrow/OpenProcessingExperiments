
import ddf.minim.*;
import ddf.minim.analysis.*;
PFont font;
PImage space;

//Assignment 5 - Vincent Ong: Music Visualizer

Minim minim;
AudioPlayer player;
BeatDetect beat;

int frames;
float bass, mids, highs;
float bassColor, midsColor, highsColor;

/* @pjs preload="space.png"; */ 


void setup()
{
  size(600, 600);
  minim = new Minim(this);
  player = minim.loadFile("shootingstars.mp3");
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());
  font = loadFont("Helvetica-Bold-48.vlw");
  player.loop();
  //player.play();
  noCursor();
  noStroke();
  smooth();
  space = loadImage("space.jpg");
  

}
 
void draw()
{  
  background (0);
  beat.detect(player.mix);
  image(space, 0, frames);
  
  if (frames < 500){
  frames-=1;
  print(frames);
  }  
  
  //Background Repeater
  if (frames == -610){
    frames = 0;
    image(space, 0, frames);
  }
  
  //Text Area
  fill (250);
  textFont (font, 12);
  text ("Artist: Bag Raiders", 10, 20);
  text ("Song: Shooting Stars", 10, 35);
  textFont (font, 15);
  text ("BASS", 100, 460);
  text ("MIDS", 280, 460);
  text ("HIGHS", 460, 460);

  //Beat Detection
  if ( beat.isKick() ) {
    bass = 200;
    bassColor = 250;
    fill (bassColor, random(0,25), 0 ,80);
    ellipse (120, height/2, bass, bass);
  }
  if ( beat.isSnare() ) {
    //background (#f1f7ff);
    mids = 200;
    midsColor = 255;
    fill (0,random(100, 150), midsColor,70);
    ellipse (300, height/2, mids, mids);
  }
  if ( beat.isHat() ) {
    highs = 200;
    highsColor = 150;
    fill (highsColor , 0 , random (100, 150), 70);
    ellipse (480, height/2, highs, highs);
  }
  
}
 


