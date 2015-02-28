
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import processing.video.*;

//MovieMaker mm;  // Declare MovieMaker object 
Capture vidCam;
int r = 255; //red tint
int g = 255; //green tint
int b = 255; //blue tintimport ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioInput input;

AudioPlayer song;
 
void setup()
{
   size(640, 480);
  vidCam = new Capture(this, width, height, 30);
  vidCam.start();
  background(0);
  smooth();
  minim = new Minim(this);
  input = minim.getLineIn();
  // this loads mysong.wav from the data folder
  song = minim.loadFile("fantasy.mp3");
  song.play();
  
   // test = new MovieMaker(this, width, height, "cream.mov",
                   //    30, MovieMaker.H263, MovieMaker.HIGH);

 
 
}
 
void captureEvent(Capture vidCam) {
  vidCam.read();
}

void draw()
{
   //tint the image based on mouse location
  //spread red 0 - 255 over the width span of the image
  //r = int (255 * ((float) mouseX / width));
    //spread green 0 - 255 over the height span of the image
  //g = int (255 * ((float) mouseY / height));
  //tint(r, g, b);
  float rr = map(song.left.get(0),-1,1,0,255);
  float gg = map(song.right.get(0),-1,1,0,255);
  float bb = (rr+gg)/2;
  tint(rr,gg,2*bb);
  //draw the video
  image(vidCam,0,0);
  filter(BLUR,3-map(song.left.get(0),-1,1,0,3));
  //for crazy drawing, comment the last line
  //and un comment the next line.
 // image(vidCam, mouseX-80, mouseY-60, 160,120)
  //background(0);
  stroke(rr,gg,bb);
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  for(int i = 0; i < song.bufferSize() - 1; i++)
  {
    line(i, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
 //  mm.addFrame();  // Add window's pixels to movie
}
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  player.close();
  // the AudioInput you got from Minim.getLineIn()
  input.close();
  minim.stop();
 
  // this calls the stop method that 
  // you are overriding by defining your own
  // it must be called so that your application 
  // can do all the cleanup it would normally do
  super.stop();
}
//void keyPressed() {
 // if (key == ' ') {
 //   mm.finish();  // Finish the movie if space bar is pressed!




