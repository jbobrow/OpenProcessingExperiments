

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;



int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 2;

void setup()
{
     minim= new Minim(this);
  player = minim.loadFile("stageselect.mp3");
  
  size(500,500);
  strokeWeight(20);
  stroke(50,150,250);
  smooth();
  background(100,100,155);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); } 
  
  
}

void draw()
{
    player.play();
  
  int currentTime = millis();
  if(currentTime > lastTime+60) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed == true) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  }
  
  void nextFrame()
{
  frames[currentFrame] = get();
  currentFrame++;
  if (currentFrame >= frames.length) {
    currentFrame = 0;
  }
  image(frames[currentFrame], 125,125, 250,250);
}




// It's fun to zoom the mac in and check out the center square
//Code definately taken from anothers Processing website
// coding help recieved from Pavel 

// Song starts right away, click and drag the mouse right away when application starts
//faulty music...is it becuase it's a Wav...?

// future reference - make fourth frame in reverse to sync up with song?

